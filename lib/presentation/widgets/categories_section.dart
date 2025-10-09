import 'package:flutter/material.dart';
import '../../core/utils/text_styles.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/app_text.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AppText(
            AppStrings.categoriesTitle(context),
            style: AppTextStyles.heading3,
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              ViewAllCategoriesButton(),
              const SizedBox(width: 12),
              CategoryCard(
                title: AppStrings.category1(context),
                imageUrl: AppStrings.categoryImage1,
              ),
              const SizedBox(width: 12),
              CategoryCard(
                title: AppStrings.category2(context),
                imageUrl: AppStrings.categoryImage2,
              ),
              const SizedBox(width: 12),
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
