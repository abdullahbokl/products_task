import 'package:flutter/material.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/common/enums/product_category.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/common/widgets/app_text.dart';
import 'form_field_label.dart';

class CategoryDropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final ProductCategory? selectedCategory;
  final ValueChanged<ProductCategory?> onChanged;
  final String? Function(ProductCategory?)? validator;
  final bool isRequired;

  const CategoryDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.selectedCategory,
    required this.onChanged,
    this.validator,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    const selectedIconColor = Color(
      0xFF5973DE,
    ); // Blue color for selected state

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldLabel(label: label, isRequired: isRequired),
        DropdownButtonFormField<ProductCategory>(
          value: selectedCategory,
          selectedItemBuilder: (BuildContext context) {
            return ProductCategory.values.map((category) {
              return AppText(
                category.getDisplayName(),
                style: AppTextStyles.bodyMedium.copyWith(
                  color: selectedCategory != null
                      ? selectedIconColor
                      : AppColors.darkGray,
                ),
              );
            }).toList();
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.mediumGray,
            ),
            filled: true,
            fillColor: AppColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              borderSide: const BorderSide(color: AppColors.borderGray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              borderSide: BorderSide(
                color: AppColors.borderGray,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              borderSide: const BorderSide(
                color: AppColors.primaryGreen,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              borderSide: const BorderSide(color: AppColors.accentRed),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              borderSide: const BorderSide(
                color: AppColors.accentRed,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingXLarge,
              vertical: AppDimensions.paddingLarge,
            ),
          ),
          // drop down arrow
          icon: const Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: selectedIconColor,
          ),
          isExpanded: true,
          style: AppTextStyles.bodyMedium.copyWith(
            color: selectedCategory != null
                ? selectedIconColor
                : AppColors.darkGray,
          ),
          items: ProductCategory.values.map((category) {
            return DropdownMenuItem<ProductCategory>(
              value: category,
              child: AppText(
                category.getDisplayName(),
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
