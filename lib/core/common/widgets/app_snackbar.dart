import 'package:flutter/material.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'app_text.dart';

/// Custom SnackBar utility for consistent messaging across the app
class AppSnackBar {
  /// Show a success snackbar with green background
  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.successGreen,
      icon: Icons.check_circle_outline,
    );
  }

  /// Show an error snackbar with red background
  static void showError(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.accentRed,
      icon: Icons.error_outline,
    );
  }

  /// Show an info snackbar with blue background
  static void showInfo(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.primaryBlue,
      icon: Icons.info_outline,
    );
  }

  /// Show a warning snackbar with orange background
  static void showWarning(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.warningOrange,
      icon: Icons.warning_amber_outlined,
    );
  }

  /// Show a custom snackbar
  static void showCustom(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    IconData? icon,
    Duration? duration,
  }) {
    _show(
      context,
      message: message,
      backgroundColor: backgroundColor,
      icon: icon,
      duration: duration,
    );
  }

  /// Internal method to show snackbar
  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    IconData? icon,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: AppColors.white,
                size: AppDimensions.iconSizeSmall,
              ),
              SizedBox(width: AppDimensions.spacingMedium),
            ],
            Expanded(
              child: AppText(
                message,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: duration ?? const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        ),
        margin: EdgeInsets.all(AppDimensions.paddingXLarge),
      ),
    );
  }
}

