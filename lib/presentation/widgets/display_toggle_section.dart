import 'package:flutter/material.dart';
import '../../core/utils/text_styles.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/app_text.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/icons/horizontal_vertical_icon.png',
              width: 24,
              height: 24,
            ),
            AppText(
              isHorizontal
                  ? AppStrings.toggleToVertical
                  : AppStrings.toggleToHorizontal,
              style: AppTextStyles.accent,
            ),
          ],
        ),
      ),
    );
  }
}

