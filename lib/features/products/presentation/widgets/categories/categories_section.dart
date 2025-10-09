import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/common/widgets/app_text.dart';
import '../../../../../core/common/enums/product_category.dart';
import '../../cubit/product_cubit.dart';
import 'category_card.dart';
import 'view_all_categories_button.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final selectedCategory = state.selectedCategory;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
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
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingXLarge,
                ),
                children: [
                  // View All button
                  ViewAllCategoriesButton(
                    isSelected: selectedCategory == null,
                    onTap: () {
                      context.read<ProductCubit>().filterByCategory(null);
                    },
                  ),
                  SizedBox(width: AppDimensions.spacingMedium),

                  // Generate category cards from enum
                  ...ProductCategory.values.map((category) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: AppDimensions.spacingMedium),
                      child: CategoryCard(
                        title: category.getDisplayName(),
                        imageUrl: category.imageUrl,
                        isSelected: selectedCategory == category.englishName,
                        onTap: () {
                          context
                              .read<ProductCubit>()
                              .filterByCategory(category.englishName);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
