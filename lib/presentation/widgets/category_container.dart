import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/text_styles.dart';
import '../../core/widgets/app_text.dart';

class CategoryContainer extends StatelessWidget {
  final Widget child;
  final String title;
  final bool isViewAll;

  const CategoryContainer({
    super.key,
    required this.child,
    required this.title,
    this.isViewAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.only(top: 7, left: 7, right: 7, bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isViewAll ? AppColors.primaryGreen : AppColors.white,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              clipBehavior: Clip.antiAlias,
              child: child,
            ),
          ),
          const SizedBox(height: 8),
          AppText(
            title,
            style: AppTextStyles.categoryTitle,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
