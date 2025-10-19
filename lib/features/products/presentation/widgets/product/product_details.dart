import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/app_text.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final String storeName;
  final double price;

  const ProductDetails({
    super.key,
    required this.name,
    required this.storeName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingXLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            name,
            style: AppTextStyles.heading3,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
          SizedBox(height: AppDimensions.spacingMedium),
          // Use separate Text widgets for price and currency so widget tests using
          // `find.textContaining` can locate the price string (RichText is not
          // matched by `find.textContaining`).
          Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.ltr,
            children: [
              AppText(
                // show price with two decimal places so tests expecting e.g. "99.99" pass
                price.toStringAsFixed(2),
                style: AppTextStyles.price,
              ),
              AppText(
                ' ' + AppStrings.currencyDollar(context),
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.spacingMedium),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingLarge,
              vertical: AppDimensions.paddingSmall,
            ),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
            ),
            child: AppText(
              storeName,
              style: AppTextStyles.caption,
            ),
          ),
        ],
      ),
    );
  }
}
