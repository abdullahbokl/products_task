import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_icon_button.dart';
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
        leading: CustomIconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: AppDimensions.iconSizeSmall,
          ),
          size: AppDimensions.iconSizeLarge,
          backgroundColor: AppColors.white,
          borderColor: AppColors.borderGray,
          borderWidth: AppDimensions.cardBorderWidth,
          borderRadius: AppDimensions.radiusLarge,
        ),
        title: AppText(
          AppStrings.addProductTitle(context),
          style: AppTextStyles.heading1.copyWith(
            color: const Color(0xFF3E3E68),
          ),
        ),
        centerTitle: true,
      ),
      body: const AddProductForm(),
    );
  }
}
