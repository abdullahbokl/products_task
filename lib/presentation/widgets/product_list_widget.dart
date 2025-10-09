import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: ProductCard(product: products[index]),
          );
        },
      );
    }
  }
}
