import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/app_text.dart';
import 'product_image.dart';

class ProductCardCompact extends StatelessWidget {
  final dynamic product;
  final VoidCallback? onDelete;

  const ProductCardCompact({super.key, required this.product, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimensions.cardElevation,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
            child: SizedBox(
              width: AppDimensions.productCardImageWidthCompact,
              height: AppDimensions.productCardImageHeightCompact,
              child: ProductImage(imageUrls: product.imageUrls),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingMedium),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    AppStrings.productPlaceholderText(context),
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGray,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: AppDimensions.spacingSmall),
                  AppText(
                    '${AppStrings.currencyDollar(context)} ${product.price.toStringAsFixed(0)}',
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryGreen,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: AppDimensions.spacingSmall),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingMedium,
                      vertical: AppDimensions.paddingXSmall,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                    ),
                    child: AppText(
                      AppStrings.storeName(context),
                      style: AppTextStyles.caption,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
