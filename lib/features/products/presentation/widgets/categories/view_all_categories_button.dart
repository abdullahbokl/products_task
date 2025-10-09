import 'package:flutter/material.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/app_strings.dart';
import 'category_container.dart';

class ViewAllCategoriesButton extends StatelessWidget {
  const ViewAllCategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryContainer(
      title: AppStrings.viewAllCategories(context),
      isViewAll: true,
      child: Container(
        color: AppColors.primaryGreen,
        child: Center(
          child: Image.asset(
            'assets/icons/element4ctg_all.png',
            width: AppDimensions.iconSizeMedium,
            height: AppDimensions.iconSizeMedium,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
