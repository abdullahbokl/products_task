import 'package:flutter/material.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/common/widgets/app_text.dart';

class DisplayToggleSection extends StatelessWidget {
  final bool isHorizontal;
  final VoidCallback onToggle;

  const DisplayToggleSection({
    super.key,
    required this.isHorizontal,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingXLarge,
          vertical: AppDimensions.paddingLarge,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              AppAssets.iconToggleLayout,
              width: AppDimensions.iconSizeSmall,
              height: AppDimensions.iconSizeSmall,
            ),
            SizedBox(width: AppDimensions.spacingSmall),
            AppText(
              isHorizontal
                  ? AppStrings.toggleToVertical(context)
                  : AppStrings.toggleToHorizontal(context),
              style: AppTextStyles.accent,
            ),
          ],
        ),
      ),
    );
  }
}
