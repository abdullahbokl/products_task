import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../cubit/product_cubit.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _storeNameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _storeNameController.dispose();
    _categoryController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Add product logic here
      context.read<ProductCubit>().addNewProduct();
      Navigator.of(context).pop();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AppText(
            AppStrings.productAddedSuccess(context),
            style: const TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.successGreen,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image Section
            _buildImageSection(),
            const SizedBox(height: AppDimensions.spacingXLarge),

            // Product Name Field
            _buildTextField(
              controller: _nameController,
              label: AppStrings.productNameLabel(context),
              hint: AppStrings.productNameHint(context),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return AppStrings.fieldRequired(context);
                }
                return null;
              },
            ),
            const SizedBox(height: AppDimensions.spacingLarge),

            // Price Field
            _buildTextField(
              controller: _priceController,
              label: AppStrings.priceLabel(context),
              hint: AppStrings.priceHint(context),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return AppStrings.fieldRequired(context);
                }
                if (double.tryParse(value!) == null) {
                  return AppStrings.invalidPrice(context);
                }
                return null;
              },
            ),
            const SizedBox(height: AppDimensions.spacingLarge),

            // Store Name Field
            _buildTextField(
              controller: _storeNameController,
              label: AppStrings.storeNameLabel(context),
              hint: AppStrings.storeNameHint(context),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return AppStrings.fieldRequired(context);
                }
                return null;
              },
            ),
            const SizedBox(height: AppDimensions.spacingLarge),

            // Category Field
            _buildTextField(
              controller: _categoryController,
              label: AppStrings.categoryLabel(context),
              hint: AppStrings.categoryHint(context),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return AppStrings.fieldRequired(context);
                }
                return null;
              },
            ),
            const SizedBox(height: AppDimensions.spacingXLarge),

            // Submit Button
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(
          color: AppColors.borderGray,
          width: AppDimensions.cardBorderWidth,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            size: 64,
            color: AppColors.mediumGray,
          ),
          const SizedBox(height: AppDimensions.spacingMedium),
          AppText(
            AppStrings.addProductImage(context),
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.mediumGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.darkGray,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSmall),
        AppTextField(
          controller: controller,
          hintText: hint,
          keyboardType: keyboardType,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _submitForm,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.paddingLarge,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        ),
        elevation: 0,
      ),
      child: AppText(
        AppStrings.addProductButton(context),
        style: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
    );
  }
}
