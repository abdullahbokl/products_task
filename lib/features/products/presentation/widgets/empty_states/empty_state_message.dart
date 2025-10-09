import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/app_text.dart';

class EmptyStateMessage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double iconSize;

  const EmptyStateMessage({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconSize = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: AppColors.mediumGray,
        ),
        const SizedBox(height: 24),
        AppText(
          title,
          style: AppTextStyles.emptyStateTitle,
        ),
        const SizedBox(height: 8),
        AppText(
          subtitle,
          style: AppTextStyles.emptyStateSubtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

