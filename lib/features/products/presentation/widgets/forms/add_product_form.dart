import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/common/widgets/app_snackbar.dart';
import '../../../../../core/services/navigation/navigation_service.dart';
import '../../../../../core/services/service_locator/service_locator.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/form_validators.dart';
import '../../cubit/product_cubit.dart';
import 'add_product_form_model.dart';
import 'category_dropdown_field.dart';
import 'custom_text_form_field.dart';
import 'multi_image_picker_section.dart';
import 'submit_button.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  late final AddProductFormModel _formModel;
  final ImagePicker _imagePicker = ImagePicker();
  bool _isPickingImage = false;

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

  Future<void> _pickImage() async {
    try {
      setState(() {
        _isPickingImage = true;
      });

      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          _formModel.addImage(image.path);
          _isPickingImage = false;
        });
      } else {
        setState(() {
          _isPickingImage = false;
        });
      }
    } catch (e) {
      setState(() {
        _isPickingImage = false;
      });
      if (!mounted) return;
      AppSnackBar.showError(context, 'فشل في اختيار الصورة');
    }
  }

  void _removeImage(int index) {
    setState(() {
      _formModel.removeImage(index);
    });
  }

  Future<void> _submitForm() async {
    if (!_formModel.validate()) return;

    final success = await context.read<ProductCubit>().addProductFromForm(
      name: _formModel.name,
      storeName: _formModel.storeName,
      price: _formModel.price,
      category: _formModel.category,
      imageUrls: _formModel.imagePaths.isNotEmpty
          ? _formModel.imagePaths
          : null,
    );

    if (!mounted) return;

    if (success) {
      getIt<NavigationService>().pop();
      AppSnackBar.showSuccess(context, AppStrings.productAddedSuccess(context));
    } else {
      final error = context.read<ProductCubit>().state.addProductStatus.error;
      AppSnackBar.showError(context, error ?? 'حدث خطأ أثناء إضافة المنتج');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) =>
          previous.addProductStatus != current.addProductStatus,
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.paddingXLarge),
          child: Form(
            key: _formModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MultiImagePickerSection(
                  imagePaths: _formModel.imagePaths,
                  onAddImage: _pickImage,
                  onRemoveImage: _removeImage,
                  isLoading: _isPickingImage,
                ),
                SizedBox(height: AppDimensions.spacingXLarge),
                CustomTextFormField(
                  controller: _formModel.nameController,
                  label: AppStrings.productNameLabel(context),
                  hint: AppStrings.productNameHint(context),
                  validator: FormValidators.required(
                    context,
                    message: AppStrings.fieldRequired(context),
                  ),
                ),
                SizedBox(height: AppDimensions.spacingLarge),
                CustomTextFormField(
                  controller: _formModel.storeNameController,
                  label: AppStrings.storeNameLabel(context),
                  hint: AppStrings.storeNameHint(context),
                  validator: FormValidators.required(
                    context,
                    message: AppStrings.fieldRequired(context),
                  ),
                ),
                SizedBox(height: AppDimensions.spacingLarge),
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
                SizedBox(height: AppDimensions.spacingLarge),
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
                SizedBox(height: AppDimensions.spacingXLarge),
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
