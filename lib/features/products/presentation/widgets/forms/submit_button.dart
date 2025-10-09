import 'package:flutter/material.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/common/widgets/app_text.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.mediumGray,
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.paddingLarge,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        ),
        elevation: 0,
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
              ),
            )
          : AppText(
              text,
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
    );
  }
}

