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
                  // View All button
                  ViewAllCategoriesButton(
                    isSelected: selectedCategory == null,
                    onTap: () {
                      context.read<ProductCubit>().filterByCategory(null);
                    },
                  ),
                  const SizedBox(width: AppDimensions.spacingMedium),

                  // Generate category cards from enum
                  ...ProductCategory.values.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: AppDimensions.spacingMedium),
                      child: CategoryCard(
                        title: category.getDisplayName(),
                        imageUrl: _getCategoryImageUrl(category),
                        isSelected: selectedCategory == category.englishName,
                        onTap: () {
                          context
                              .read<ProductCubit>()
                              .filterByCategory(category.englishName);
                        },
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // Helper method to get image URLs for categories
  String _getCategoryImageUrl(ProductCategory category) {
    switch (category) {
      case ProductCategory.architecture:
        return 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400';
      case ProductCategory.electronics:
        return 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400';
      case ProductCategory.fashion:
        return 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=400';
      case ProductCategory.food:
        return 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400';
      case ProductCategory.furniture:
        return 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400';
      case ProductCategory.sports:
        return 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=400';
      case ProductCategory.books:
        return 'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=400';
      case ProductCategory.toys:
        return 'https://images.unsplash.com/photo-1558877385-09dd715f6a2c?w=400';
    }
  }
}
