import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class ProductImage extends StatelessWidget {
  final List<String> imageUrls;

  const ProductImage({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrls.isNotEmpty
        ? Image.network(
            imageUrls.first,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                  Icons.image_not_supported,
                  color: AppColors.mediumGray,
                  size: 48,
                ),
              );
            },
          )
        : const Center(
            child: Icon(
              Icons.image,
              color: AppColors.mediumGray,
              size: 48,
            ),
          );
  }
}

