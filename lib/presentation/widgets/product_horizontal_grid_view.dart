import 'package:flutter/material.dart';
import '../../core/constants/app_dimensions.dart';
import '../../domain/entities/product.dart';
import 'product_card_compact.dart';

class ProductHorizontalGridView extends StatelessWidget {
  final List<Product> products;

  const ProductHorizontalGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppDimensions.spacingSmall,
        crossAxisSpacing: AppDimensions.spacingSmall,
        childAspectRatio: 0.6,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCardCompact(product: products[index]);
      },
    );
  }
}
