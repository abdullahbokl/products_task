import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import 'category_container.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CategoryContainer(
      title: title,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: AppColors.lightGray,
            child: const Center(
              child: Icon(Icons.image, color: AppColors.mediumGray),
            ),
          );
        },
      ),
    );
  }
}

