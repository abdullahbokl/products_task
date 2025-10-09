import 'package:flutter/material.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/common/widgets/app_text.dart';
import '../../../../../core/common/widgets/app_loader.dart';

class ImagePickerSection extends StatelessWidget {
  final VoidCallback? onTap;
  final String? imageUrl;

  const ImagePickerSection({
    super.key,
    this.onTap,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          border: Border.all(
            color: AppColors.borderGray,
            width: AppDimensions.cardBorderWidth,
          ),
        ),
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: AppLoader(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholder(context);
                  },
                ),
              )
            : _buildPlaceholder(context),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_photo_alternate_outlined,
          size: 64,
          color: AppColors.mediumGray,
        ),
        const SizedBox(height: AppDimensions.spacingMedium),
        AppText(
          AppStrings.addProductImage(context),
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.mediumGray,
          ),
        ),
      ],
    );
  }
}
