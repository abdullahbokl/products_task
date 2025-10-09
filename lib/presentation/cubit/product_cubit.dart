import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/helpers/bloc_status.dart';
import '../../core/utils/app_strings.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/delete_product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;
  final DeleteProduct deleteProduct;

  ProductCubit({
    required this.getProducts,
    required this.deleteProduct,
  }) : super(ProductState.initial());

  Future<void> loadProducts() async {
    // AppStrings.commentKeepExistingData
    final existing = state.status.data;
    emit(ProductState.loading(data: existing));
    try {
      final products = await getProducts();
      if (products.isEmpty) {
        emit(ProductState.empty());
      } else {
        emit(ProductState.success(products));
      }
    } catch (e) {
      emit(ProductState.failure(e.toString(), data: existing));
    }
  }

  void addNewProduct() {
    final currentProducts = state.status.data ?? [];
    final newProduct = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: AppStrings.sampleProductName,
      storeName: AppStrings.sampleStoreName,
      price: 120.0,
      category: AppStrings.sampleCategory,
      imageUrls: [AppStrings.sampleImageUrl],
    );
    final updatedProducts = [newProduct, ...currentProducts];
    emit(ProductState.success(updatedProducts));
  }

  Future<void> removeProduct(String productId) async {
    final existing = state.status.data ?? [];
    try {
      await deleteProduct(productId);
      await loadProducts(); // AppStrings.commentReloadList
    } catch (e) {
      emit(ProductState.failure(e.toString(), data: existing));
    }
  }
}

