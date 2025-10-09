import 'package:flutter/material.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../domain/entities/product.dart';
import 'product_card.dart';
import 'product_horizontal_grid_view.dart';

class ProductListWidget extends StatelessWidget {
  final List<Product> products;
  final bool isHorizontal;

  const ProductListWidget({
    super.key,
    required this.products,
    required this.isHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    // Show empty state message if no products
    if (products.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: 80,
                color: AppColors.mediumGray,
              ),
              const SizedBox(height: AppDimensions.spacingLarge),
              AppText(
                'لا توجد منتجات في هذه الفئة',
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.mediumGray,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.spacingSmall),
              AppText(
                'اختر فئة أخرى أو أضف منتجات جديدة',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.mediumGray,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    if (isHorizontal) {
      return ProductHorizontalGridView(products: products);
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: AppDimensions.paddingXLarge),
            child: ProductCard(product: products[index]),
          );
        },
      );
    }
  }
}
