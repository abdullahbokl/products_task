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
    : super(ProductState.initial());

  Future<void> loadProducts() async {
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
    // Note: In a real app, you would get context here to use localized strings
    // For now, using static values as this is business logic layer
    final newProduct = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: 'هذا النص هو مثال لنص',
      storeName: 'اسم المتجر',
      price: 120.0,
      category: 'Architecture',
      imageUrls: [AppStrings.sampleImageUrl],
    );
    final updatedProducts = [newProduct, ...currentProducts];
    emit(ProductState.success(updatedProducts));
  }

  Future<void> removeProduct(String productId) async {
    final existing = state.status.data ?? [];
    try {
      await deleteProduct(productId);
      await loadProducts();
    } catch (e) {
      emit(ProductState.failure(e.toString(), data: existing));
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
