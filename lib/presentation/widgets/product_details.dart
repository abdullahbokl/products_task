import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/text_styles.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/app_text.dart';

class ProductDetails extends StatelessWidget {
  final double price;

  const ProductDetails({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            AppStrings.productPlaceholderText,
            style: AppTextStyles.heading3,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          AppText(
            '${price.toStringAsFixed(0)} ${AppStrings.currencyDollar}',
            style: AppTextStyles.price,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
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
      ),
    );
  }
}

