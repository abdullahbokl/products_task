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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        const AppText(
          AppStrings.productPlaceholderText,
          style: AppTextStyles.heading3,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
        ),
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
                text: AppStrings.currencyDollar,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.lightGray,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const AppText(
            AppStrings.storeName,
            style: AppTextStyles.caption,
          ),
        ),
      ],
    );
  }
}
