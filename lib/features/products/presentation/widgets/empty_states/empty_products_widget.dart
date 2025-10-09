import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../core/common/widgets/app_text.dart';
import 'empty_state_message.dart';

class EmptyProductsWidget extends StatelessWidget {
  const EmptyProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.spacingXLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmptyStateMessage(
              icon: Icons.inventory_2_outlined,
              title: AppStrings.emptyProductsTitle(context),
              subtitle: AppStrings.emptyProductsSubtitle(context),
            ),
            SizedBox(height: Responsive.scaleSpacing(32)),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: AppText(AppStrings.addProductButton(context)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.scaleSpacing(24),
                  vertical: Responsive.scaleSpacing(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
