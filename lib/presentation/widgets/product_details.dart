import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/text_styles.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/app_text.dart';

class ProductDetails extends StatelessWidget {
  final double price;

  const ProductDetails({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            AppStrings.productPlaceholderText(context),
            style: AppTextStyles.heading3,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 12),
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
                  text: '${AppStrings.currencyDollar(context)}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(6),
            ),
            child: AppText(
              AppStrings.storeName(context),
              style: AppTextStyles.caption,
            ),
          ),
        ],
      ),
    );
  }
}
