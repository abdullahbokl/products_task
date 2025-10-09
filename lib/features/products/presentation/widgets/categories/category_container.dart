import 'package:flutter/material.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/common/widgets/app_text.dart';

class CategoryContainer extends StatelessWidget {
  final Widget child;
  final String title;
  final bool isViewAll;
  final bool isSelected;

  const CategoryContainer({
    super.key,
    required this.child,
    required this.title,
    this.isViewAll = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.categoryCardWidth,
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingXSmall),
      padding: const EdgeInsets.only(
        top: AppDimensions.categoryCardInnerPaddingTop,
        left: AppDimensions.categoryCardInnerPaddingHorizontal,
        right: AppDimensions.categoryCardInnerPaddingHorizontal,
        bottom: AppDimensions.categoryCardInnerPaddingBottom,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(
          color: (isViewAll || isSelected) ? AppColors.primaryGreen : AppColors.white,
          width: AppDimensions.categoryCardBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: AppDimensions.shadowOpacity),
            blurRadius: AppDimensions.shadowBlurRadius,
            offset: const Offset(0, AppDimensions.shadowOffsetY),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              ),
              clipBehavior: Clip.antiAlias,
              child: child,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSmall),
          AppText(
            title,
            style: AppTextStyles.categoryTitle.copyWith(
              color: isSelected ? AppColors.primaryGreen : null,
              fontWeight: isSelected ? FontWeight.bold : null,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
