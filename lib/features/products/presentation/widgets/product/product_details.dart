import 'package:flutter/material.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/common/widgets/app_text.dart';

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
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: '${price.toStringAsFixed(0)} ',
                  style: AppTextStyles.price,
                ),
                TextSpan(
                  text: AppStrings.currencyDollar(context),
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
              ],
            ),
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
