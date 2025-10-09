import 'package:flutter/material.dart';
import '../../core/constants/app_dimensions.dart';
import '../../domain/entities/product.dart';
import 'product_card.dart';
import 'product_horizontal_grid_view.dart';

class ProductListWidget extends StatelessWidget {
  final List<Product> products;
  final bool isHorizontal;

  const ProductListWidget({
    super.key,
    required this.products,
    required this.isHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return ProductHorizontalGridView(products: products);
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: AppDimensions.paddingXLarge),
            child: ProductCard(product: products[index]),
          );
        },
      );
    }
  }
}
