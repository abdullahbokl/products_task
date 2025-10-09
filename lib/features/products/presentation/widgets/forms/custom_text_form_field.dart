import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/common/widgets/app_text_field.dart';
import 'form_field_label.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isRequired;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.validator,
    this.isRequired = true,
    this.maxLines = 1,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormFieldLabel(
          label: label,
          isRequired: isRequired,
        ),
        AppTextField(
          controller: controller,
          hintText: hint,
          keyboardType: keyboardType,
          validator: validator,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}

