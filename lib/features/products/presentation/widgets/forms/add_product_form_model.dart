import 'package:flutter/material.dart';

/// Form model to manage add product form state and controllers
class AddProductFormModel {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController storeNameController;
  final TextEditingController categoryController;

  AddProductFormModel()
      : formKey = GlobalKey<FormState>(),
        nameController = TextEditingController(),
        priceController = TextEditingController(),
        storeNameController = TextEditingController(),
        categoryController = TextEditingController();

  /// Validate the form
  bool validate() => formKey.currentState?.validate() ?? false;

  /// Get product name
  String get name => nameController.text.trim();

  /// Get store name
  String get storeName => storeNameController.text.trim();

  /// Get price as double (handles parsing and defaults to 0.0 if invalid)
  double get price => double.tryParse(priceController.text.trim()) ?? 0.0;

  /// Get category
  String get category => categoryController.text.trim();

  /// Check if all required fields are filled
  bool get isValid {
    return name.isNotEmpty &&
        storeName.isNotEmpty &&
        category.isNotEmpty &&
        price > 0;
  }

  /// Get form data as a map (deprecated - use individual getters instead)
  @Deprecated('Use individual getters (name, storeName, price, category) instead')
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'storeName': storeName,
      'category': category,
    };
  }

  /// Check if form has data
  bool get hasData {
    return name.isNotEmpty ||
        priceController.text.trim().isNotEmpty ||
        storeName.isNotEmpty ||
        category.isNotEmpty;
  }

  /// Clear all form fields
  void clear() {
    nameController.clear();
    priceController.clear();
    storeNameController.clear();
    categoryController.clear();
  }

  /// Dispose all controllers
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    storeNameController.dispose();
    categoryController.dispose();
  }
}
