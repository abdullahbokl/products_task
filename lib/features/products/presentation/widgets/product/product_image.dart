import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../core/common/widgets/app_loader.dart';

class ProductImage extends StatelessWidget {
  final List<String> imageUrls;

  const ProductImage({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return Center(
        child: Icon(
          Icons.image,
          color: AppColors.mediumGray,
          size: Responsive.scaleSize(48),
        ),
      );
    }

    // Get the first image from the list
    final firstImage = imageUrls.first;

    // Check if it's a network URL or local file path
    final isNetworkImage =
        firstImage.startsWith('http://') || firstImage.startsWith('https://');

    return isNetworkImage
        ? Image.network(
            firstImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: AppLoader(),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  Icons.image_not_supported,
                  color: AppColors.mediumGray,
                  size: Responsive.scaleSize(48),
                ),
              );
            },
          )
        : Image.file(
            File(firstImage),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  Icons.image_not_supported,
                  color: AppColors.mediumGray,
                  size: Responsive.scaleSize(48),
                ),
              );
            },
          );
  }
}
