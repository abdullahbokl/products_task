import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';

class ProductImage extends StatelessWidget {
  final List<String> imageUrls;

  const ProductImage({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return const Center(
        child: Icon(
          Icons.image,
          color: AppColors.mediumGray,
          size: 48,
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
        : Image.file(
            File(firstImage),
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
          );
  }
}
