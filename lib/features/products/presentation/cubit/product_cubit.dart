import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/helpers/bloc_status.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/add_product.dart';
import '../../domain/usecases/delete_product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;
  final AddProduct addProduct;
  final DeleteProduct deleteProduct;

  ProductCubit({
    required this.getProducts,
    required this.addProduct,
    required this.deleteProduct,
  }) : super(const ProductState());

  Future<void> loadProducts() async {
    final existing = state.getProductsStatus.data;
    emit(state.copyWith(
      getProductsStatus: BlocStatus.loading(data: existing),
    ));

    try {
      final products = await getProducts();
      if (products.isEmpty) {
        emit(state.copyWith(
          getProductsStatus: const BlocStatus.empty(),
        ));
      } else {
        emit(state.copyWith(
          getProductsStatus: BlocStatus.success(data: products),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getProductsStatus: BlocStatus.fail(error: e.toString(), data: existing),
      ));
    }
  }

  void addNewProduct() {
    final currentProducts = state.getProductsStatus.data ?? [];
    final newProduct = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: 'هذا النص هو مثال لنص',
      storeName: 'اسم المتجر',
      price: 120.0,
      category: 'Architecture',
      imageUrls: [AppStrings.sampleImageUrl],
    );
    final updatedProducts = [newProduct, ...currentProducts];
    emit(state.copyWith(
      getProductsStatus: BlocStatus.success(data: updatedProducts),
    ));
  }

  /// Add product from form with proper state management
  /// Returns true if successful, false if failed
  Future<bool> addProductFromForm({
    required String name,
    required String storeName,
    required double price,
    required String category,
    List<String>? imageUrls,
  }) async {
    // Emit loading state
    emit(state.copyWith(
      addProductStatus: const BlocStatus.loading(),
    ));

    try {
      // Validate input
      if (name.isEmpty || storeName.isEmpty || category.isEmpty || price <= 0) {
        emit(state.copyWith(
          addProductStatus: const BlocStatus.fail(
            error: 'جميع الحقول مطلوبة والسعر يجب أن يكون أكبر من صفر',
          ),
        ));
        return false;
      }

      // Create new product with multiple images
      final newProduct = Product(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        storeName: storeName,
        price: price,
        category: category,
        imageUrls: imageUrls != null && imageUrls.isNotEmpty
            ? imageUrls
            : [AppStrings.sampleImageUrl],
      );

      // Add product through usecase
      await addProduct(newProduct);

      // Reload products to get the updated list
      await loadProducts();

      // Emit success state
      emit(state.copyWith(
        addProductStatus: BlocStatus.success(data: newProduct),
      ));

      return true;
    } catch (e) {
      // Emit failure state
      emit(state.copyWith(
        addProductStatus: BlocStatus.fail(error: e.toString()),
      ));
      return false;
    }
  }

  /// Reset add product status to initial state
  void resetAddProductStatus() {
    emit(state.copyWith(
      addProductStatus: const BlocStatus.initial(),
    ));
  }

  /// Filter products by category
  void filterByCategory(String? category) {
    emit(state.copyWith(
      selectedCategory: category,
      clearCategory: category == null,
    ));
  }

  /// Get filtered products based on selected category
  List<Product> getFilteredProducts() {
    final allProducts = state.getProductsStatus.data ?? [];
    final selectedCategory = state.selectedCategory;

    if (selectedCategory == null) {
      return allProducts; // Show all products
    }

    return allProducts.where((product) => product.category == selectedCategory).toList();
  }

  Future<void> removeProduct(String productId) async {
    try {
      await deleteProduct(productId);
      await loadProducts();
    } catch (e) {
      final existing = state.getProductsStatus.data ?? [];
      emit(state.copyWith(
        getProductsStatus: BlocStatus.fail(error: e.toString(), data: existing),
      ));
    }
  }
}
