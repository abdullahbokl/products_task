import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/common/widgets/app_text.dart';
import '../../../../../core/common/widgets/app_loader.dart';

class MultiImagePickerSection extends StatelessWidget {
  final List<String> imagePaths;
  final VoidCallback onAddImage;
  final Function(int) onRemoveImage;

  const MultiImagePickerSection({
    super.key,
    required this.imagePaths,
    required this.onAddImage,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          AppStrings.productImagesLabel(context),
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.darkGray,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSmall),

        // Vertical list of images
        if (imagePaths.isNotEmpty) ...[
          // Images grid
          SizedBox(
            height: AppDimensions.imagePickerGridHeight,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: AppDimensions.spacingMedium,
                childAspectRatio: 1,
              ),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return _buildImageItem(imagePaths[index], index);
              },
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMedium),
        ],

        // Add button always at the bottom
        _buildAddButton(),
      ],
    );
  }

  Widget _buildImageItem(String imagePath, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(
          color: AppColors.borderGray,
          width: AppDimensions.cardBorderWidth,
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
            child: imagePath.startsWith('http')
                ? Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: AppLoader(size: 25),
                      );
                    },
                  )
                : Image.file(
                    File(imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
          ),
          // Delete button
          Positioned(
            top: AppDimensions.spacingSmall,
            left: AppDimensions.spacingSmall,
            child: GestureDetector(
              onTap: () => onRemoveImage(index),
              child: Container(
                width: AppDimensions.iconSizeSmall,
                height: AppDimensions.iconSizeSmall,
                decoration: BoxDecoration(
                  color: AppColors.accentRed.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: AppColors.white,
                  size: AppDimensions.spacingLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: onAddImage,
      child: Container(
        height: AppDimensions.imagePickerButtonHeight,
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            size: AppDimensions.iconSizeMedium,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
