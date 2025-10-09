import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/app_strings.dart';
import '../../core/widgets/app_text.dart';
import 'empty_state_message.dart';

class EmptyProductsWidget extends StatelessWidget {
  const EmptyProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EmptyStateMessage(
              icon: Icons.inventory_2_outlined,
              title: AppStrings.emptyProductsTitle,
              subtitle: AppStrings.emptyProductsSubtitle,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                // AppStrings.commentAddProductFunctionality
              },
              icon: const Icon(Icons.add),
              label: const AppText(AppStrings.addProductButton),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

