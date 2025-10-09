import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';
import '../../utils/app_strings.dart';
import '../../utils/colors.dart';
import '../../utils/responsive.dart';
import '../../utils/text_styles.dart';
import 'app_text.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  const AppErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.spacingXLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: Responsive.scaleSize(64),
              color: AppColors.accentRed,
            ),
            SizedBox(height: AppDimensions.spacingLarge),
            AppText(
              AppStrings.errorTitle(context),
              style: AppTextStyles.heading2,
            ),
            SizedBox(height: AppDimensions.spacingSmall),
            AppText(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),
            if (onRetry != null) ...[
              SizedBox(height: AppDimensions.spacingXLarge),
              ElevatedButton(
                onPressed: onRetry,
                child: AppText(AppStrings.tryAgainButton(context)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
