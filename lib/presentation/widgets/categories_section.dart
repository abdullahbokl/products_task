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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AppText(
            AppStrings.categoriesTitle,
            style: AppTextStyles.heading3,
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              ViewAllCategoriesButton(),
              SizedBox(width: 12),
              CategoryCard(
                title: AppStrings.category1,
                imageUrl: AppStrings.categoryImage1,
              ),
              SizedBox(width: 12),
              CategoryCard(
                title: AppStrings.category2,
                imageUrl: AppStrings.categoryImage2,
              ),
              SizedBox(width: 12),
              CategoryCard(
                title: AppStrings.category3,
                imageUrl: AppStrings.categoryImage3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

