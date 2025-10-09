import 'package:flutter/material.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/app_text.dart';

class FormFieldLabel extends StatelessWidget {
  final String label;
  final bool isRequired;

  const FormFieldLabel({
    super.key,
    required this.label,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spacingSmall),
      child: Row(
        children: [
          AppText(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
            ),
          ),
          if (isRequired) ...[
            const SizedBox(width: AppDimensions.spacingXSmall),
            AppText(
              '*',
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.accentRed,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
