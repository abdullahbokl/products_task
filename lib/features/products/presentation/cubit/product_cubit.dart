import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/usecases/usecase.dart';
import '../../../../core/helpers/bloc_status.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/add_product_usecase.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/get_products_usecase.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUsecase getProductsUsecase;
  final AddProductUsecase addProductUsecase;
  final DeleteProductUsecase deleteProductUsecase;

  ProductCubit({
    required this.getProductsUsecase,
    required this.addProductUsecase,
    required this.deleteProductUsecase,
  }) : super(const ProductState());

  Future<void> loadProducts() async {
    final existing = state.getProductsStatus.data;
    emit(state.copyWith(getProductsStatus: BlocStatus.loading(data: existing)));

    final result = await getProductsUsecase(const NoParams());

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getProductsStatus: BlocStatus.fail(
              error: failure.message,
              data: existing,
            ),
          ),
        );
      },
      (products) {
        if (products.isEmpty) {
          emit(state.copyWith(getProductsStatus: const BlocStatus.empty()));
        } else {
          emit(
            state.copyWith(
              getProductsStatus: BlocStatus.success(data: products),
            ),
          );
        }
      },
    );
  }

  Future<bool> addProductFromForm({
    required String name,
    required String storeName,
    required double price,
    required String category,
    List<String>? imageUrls,
  }) async {
    emit(state.copyWith(addProductStatus: const BlocStatus.loading()));

    final error = _validateFormInputs(
      name: name,
      storeName: storeName,
      price: price,
      category: category,
    );

    if (error != null) {
      _emitFailureStatus(error);
      return false;
    }

    final product = _buildProduct(
      name: name,
      storeName: storeName,
      price: price,
      category: category,
      imageUrls: imageUrls,
    );

    return await _addProduct(product);
  }

  String? _validateFormInputs({
    required String name,
    required String storeName,
    required double price,
    required String category,
  }) {
    return _validateInput(
      name: name,
      storeName: storeName,
      price: price,
      category: category,
    );
  }

  void _emitFailureStatus(String error) {
    emit(state.copyWith(addProductStatus: BlocStatus.fail(error: error)));
  }

  Product _buildProduct({
    required String name,
    required String storeName,
    required double price,
    required String category,
    List<String>? imageUrls,
  }) {
    return _createNewProduct(
      name: name,
      storeName: storeName,
      price: price,
      category: category,
      imageUrls: imageUrls,
    );
  }

  Future<bool> _addProduct(Product product) async {
    return await _performAddProduct(product);
  }

  // Validates input fields, returns error message or null if valid
  String? _validateInput({
    required String name,
    required String storeName,
    required double price,
    required String category,
  }) {
    if (name.isEmpty || storeName.isEmpty || category.isEmpty || price <= 0) {
      return 'جميع الحقول مطلوبة والسعر يجب أن يكون أكبر من صفر';
    }
    return null;
  }

  // Creates a Product instance from provided fields
  Product _createNewProduct({
    required String name,
    required String storeName,
    required double price,
    required String category,
    List<String>? imageUrls,
  }) {
    return Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      storeName: storeName,
      price: price,
      category: category,
      imageUrls: imageUrls != null && imageUrls.isNotEmpty
          ? imageUrls
          : [AppStrings.sampleImageUrl],
    );
  }

  // Calls the addProduct usecase and emits appropriate states. Returns true on success.
  Future<bool> _performAddProduct(Product newProduct) async {
    final result = await addProductUsecase(
      AddProductParams(product: newProduct),
    );

    final bool success = await result.fold(
      (failure) async {
        emit(
          state.copyWith(
            addProductStatus: BlocStatus.fail(error: failure.message),
          ),
        );
        return false;
      },
      (addedProduct) async {
        // reload products to refresh the list
        await loadProducts();

        emit(
          state.copyWith(
            addProductStatus: BlocStatus.success(data: addedProduct),
          ),
        );
        return true;
      },
    );

    return success;
  }

  /// Filter products by category
  void filterByCategory(String? category) {
    emit(
      state.copyWith(
        selectedCategory: category,
        clearCategory: category == null,
      ),
    );
  }

  /// Get filtered products based on selected category
  List<Product> getFilteredProducts() {
    final allProducts = state.getProductsStatus.data ?? [];
    final selectedCategory = state.selectedCategory;

    if (selectedCategory == null) {
      return allProducts; // Show all products
    }

    return allProducts
        .where((product) => product.category == selectedCategory)
        .toList();
  }
}
