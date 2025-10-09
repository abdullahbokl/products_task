import 'package:flutter/material.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/app_text.dart';
import 'category_card.dart';
import 'view_all_categories_button.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingXLarge,
            vertical: AppDimensions.paddingMedium,
          ),
          child: AppText(
            AppStrings.categoriesTitle(context),
            style: AppTextStyles.heading3,
          ),
        ),
        SizedBox(
          height: AppDimensions.categoryCardHeight,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingXLarge,
            ),
            children: [
              const ViewAllCategoriesButton(),
              const SizedBox(width: AppDimensions.spacingMedium),
              CategoryCard(
                title: AppStrings.category1(context),
                imageUrl: AppStrings.categoryImage1,
              ),
              const SizedBox(width: AppDimensions.spacingMedium),
              CategoryCard(
                title: AppStrings.category2(context),
                imageUrl: AppStrings.categoryImage2,
              ),
              const SizedBox(width: AppDimensions.spacingMedium),
              CategoryCard(
                title: AppStrings.category3(context),
                imageUrl: AppStrings.categoryImage3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
