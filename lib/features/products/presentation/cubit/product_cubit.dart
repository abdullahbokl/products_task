import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/helpers/bloc_status.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/delete_product.dart';
import '../widgets/categories/category_container.dart';
import '../../../../core/utils/colors.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;
  final DeleteProduct deleteProduct;

  ProductCubit({required this.getProducts, required this.deleteProduct})
      : super(const ProductState());

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

      final currentProducts = state.getProductsStatus.data ?? [];

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

      final updatedProducts = [newProduct, ...currentProducts];

      // Emit success state
      emit(state.copyWith(
        getProductsStatus: BlocStatus.success(data: updatedProducts),
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

class ViewAllCategoriesButton extends StatelessWidget {
  const ViewAllCategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryContainer(
      title: AppStrings.viewAllCategories(context),
      isViewAll: true,
      child: Container(
        color: AppColors.primaryGreen,
        child: Center(
          child: Image.asset(
            'assets/icons/element4ctg_all.png',
            width: 32,
            height: 32,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
