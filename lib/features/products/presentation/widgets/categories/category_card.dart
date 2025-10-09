import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import 'category_container.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;
  final bool isSelected;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CategoryContainer(
        title: title,
        isSelected: isSelected,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: AppLoader(size: 25),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.lightGray,
              child: const Center(
                child: Icon(Icons.image, color: AppColors.mediumGray),
              ),
            );
          },
        ),
      ),
    );
  }
}
