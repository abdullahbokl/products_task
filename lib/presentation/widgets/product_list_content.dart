import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import 'categories_section.dart';
import 'display_toggle_section.dart';
import 'product_list_widget.dart';

class ProductListContent extends StatelessWidget {
  final List<Product> products;
  final bool isHorizontal;
  final VoidCallback onToggle;

  const ProductListContent({
    super.key,
    required this.products,
    required this.isHorizontal,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoriesSection(),
        DisplayToggleSection(
          isHorizontal: isHorizontal,
          onToggle: onToggle,
        ),
        Expanded(
          child: ProductListWidget(
            products: products,
            isHorizontal: isHorizontal,
          ),
        ),
      ],
    );
  }
}

