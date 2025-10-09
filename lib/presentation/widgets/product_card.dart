import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import 'product_details.dart';
import 'product_image.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onDelete;

  const ProductCard({super.key, required this.product, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 114,
              height: 115,
              child: ProductImage(imageUrls: product.imageUrls),
            ),
          ),
          Expanded(child: ProductDetails(price: product.price)),
        ],
      ),
    );
  }
}
