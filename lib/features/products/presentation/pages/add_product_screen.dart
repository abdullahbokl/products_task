import 'package:flutter/material.dart';
import '../../../../core/utils/app_dimensions.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/common/widgets/app_text.dart';
import '../../../../core/common/widgets/custom_icon_button.dart';
import '../../../../core/services/service_locator/service_locator.dart';
import '../../../../core/services/navigation/navigation_service.dart';
import '../widgets/forms/add_product_form.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomIconButton(
            onPressed: () => getIt<NavigationService>().pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: AppDimensions.iconSizeSmall,
            ),
            size: AppDimensions.iconSizeLarge,
            backgroundColor: AppColors.white,
            borderColor: AppColors.borderGray,
            borderWidth: AppDimensions.cardBorderWidth,
            borderRadius: AppDimensions.radiusLarge,
            padding: EdgeInsets.zero,
          ),
        ),
        title: AppText(
          AppStrings.addProductTitle(context),
          style: AppTextStyles.heading2.copyWith(
            color: const Color(0xFF3E3E68),
          ),
        ),
        centerTitle: true,
      ),
      body: const AddProductForm(),
    );
  }
}
