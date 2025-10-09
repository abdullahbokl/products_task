import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/text_styles.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/app_text.dart';

class ViewAllCategoriesButton extends StatelessWidget {
  const ViewAllCategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.grid_view,
            color: AppColors.white,
            size: 24,
          ),
          SizedBox(height: 8),
          AppText(
            AppStrings.viewAllCategories,
            style: AppTextStyles.whiteButton,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

