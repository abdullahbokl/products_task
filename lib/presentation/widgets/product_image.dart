import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';

class ProductImage extends StatelessWidget {
  final List<String> imageUrls;

  const ProductImage({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: SizedBox(
        height: 140,
        width: double.infinity,
        child: imageUrls.isNotEmpty
            ? Image.network(
                imageUrls.first,
                fit: BoxFit.cover,
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
              ),
      ),
    );
  }
}

