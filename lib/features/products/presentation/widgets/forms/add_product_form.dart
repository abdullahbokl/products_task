import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/form_validators.dart';
import '../../../../../core/widgets/app_snackbar.dart';
import '../../cubit/product_cubit.dart';
import 'add_product_form_model.dart';
import 'custom_text_form_field.dart';
import 'category_dropdown_field.dart';
import 'image_picker_section.dart';
import 'submit_button.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  late final AddProductFormModel _formModel;
  String? _selectedImageUrl;

  @override
  void initState() {
    super.initState();
    _formModel = AddProductFormModel();
  }

  @override
  void dispose() {
    _formModel.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    // Validate form
    if (!_formModel.validate()) return;

    // Call Cubit with model's data (Cubit handles all logic)
    final success = await context.read<ProductCubit>().addProductFromForm(
          name: _formModel.name,
          storeName: _formModel.storeName,
          price: _formModel.price,
          category: _formModel.category,
          imageUrl: _selectedImageUrl,
        );

    // Handle UI based on result
    if (!mounted) return;

    if (success) {
      Navigator.of(context).pop();
      AppSnackBar.showSuccess(
        context,
        AppStrings.productAddedSuccess(context),
      );
    } else {
      final error = context.read<ProductCubit>().state.addProductStatus.error;
      AppSnackBar.showError(
        context,
        error ?? 'حدث خطأ أثناء إضافة المنتج',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) =>
          previous.addProductStatus != current.addProductStatus,
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
          child: Form(
            key: _formModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImagePickerSection(
                  imageUrl: _selectedImageUrl,
                  onTap: () => setState(
                    () => _selectedImageUrl = 'https://via.placeholder.com/400',
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingXLarge),
                CustomTextFormField(
                  controller: _formModel.nameController,
                  label: AppStrings.productNameLabel(context),
                  hint: AppStrings.productNameHint(context),
                  validator: FormValidators.required(
                    context,
                    message: AppStrings.fieldRequired(context),
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingLarge),
                CustomTextFormField(
                  controller: _formModel.storeNameController,
                  label: AppStrings.storeNameLabel(context),
                  hint: AppStrings.storeNameHint(context),
                  validator: FormValidators.required(
                    context,
                    message: AppStrings.fieldRequired(context),
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingLarge),
                CustomTextFormField(
                  controller: _formModel.priceController,
                  label: AppStrings.priceLabel(context),
                  hint: AppStrings.priceHint(context),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: FormValidators.price(
                    context,
                    requiredMessage: AppStrings.fieldRequired(context),
                    message: AppStrings.invalidPrice(context),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\.?\d{0,2}'),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacingLarge),
                CategoryDropdownField(
                  label: AppStrings.categoryLabel(context),
                  hint: AppStrings.categoryHint(context),
                  selectedCategory: _formModel.selectedCategory,
                  onChanged: (category) {
                    setState(() {
                      _formModel.selectedCategory = category;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return AppStrings.fieldRequired(context);
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingXLarge),
                SubmitButton(
                  onPressed: _submitForm,
                  text: AppStrings.addProductButton(context),
                  isLoading: state.addProductStatus.isLoading(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
