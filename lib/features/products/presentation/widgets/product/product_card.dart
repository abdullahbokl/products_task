import 'package:flutter/material.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../domain/entities/product.dart';
import 'product_details.dart';
import 'product_image.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onDelete;

  const ProductCard({super.key, required this.product, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimensions.cardElevation,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: Row(
        spacing: AppDimensions.spacingSmall,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
            child: SizedBox(
              width: AppDimensions.productCardImageWidth,
              height: AppDimensions.productCardImageHeight,
              child: ProductImage(imageUrls: product.imageUrls),
            ),
          ),
          Expanded(child: ProductDetails(price: product.price)),
        ],
      ),
    );
  }
}
