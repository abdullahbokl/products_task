/// Test Helpers and Constants for Products Task Tests
///
/// This file contains common test data, mock objects, and helper functions
/// used across multiple test files.

import 'package:products_task/features/products/data/models/product_model.dart';
import 'package:products_task/features/products/domain/entities/product.dart';

/// Common test products used across different tests
class TestProducts {
  static const product1 = Product(
    id: '1',
    name: 'Test Product 1',
    storeName: 'Test Store 1',
    price: 99.99,
    category: 'Electronics',
    imageUrls: ['https://example.com/image1.jpg'],
  );

  static const product2 = Product(
    id: '2',
    name: 'Test Product 2',
    storeName: 'Test Store 2',
    price: 199.99,
    category: 'Fashion',
    imageUrls: ['https://example.com/image2.jpg'],
  );

  static const product3 = Product(
    id: '3',
    name: 'Test Product 3',
    storeName: 'Test Store 3',
    price: 299.99,
    category: 'Electronics',
    imageUrls: [
      'https://example.com/image3-1.jpg',
      'https://example.com/image3-2.jpg',
    ],
  );

  static const productModel1 = ProductModel(
    id: '1',
    name: 'Test Product 1',
    storeName: 'Test Store 1',
    price: 99.99,
    category: 'Electronics',
    imageUrls: ['https://example.com/image1.jpg'],
  );

  static const productModel2 = ProductModel(
    id: '2',
    name: 'Test Product 2',
    storeName: 'Test Store 2',
    price: 199.99,
    category: 'Fashion',
    imageUrls: ['https://example.com/image2.jpg'],
  );

  static List<Product> get allProducts => [product1, product2, product3];

  static List<ProductModel> get allProductModels => [
    productModel1,
    productModel2,
  ];
}

/// Common test JSON data
class TestJsonData {
  static const productJson1 = {
    'id': '1',
    'name': 'Test Product 1',
    'storeName': 'Test Store 1',
    'price': 99.99,
    'category': 'Electronics',
    'imageUrls': ['https://example.com/image1.jpg'],
  };

  static const productJson2 = {
    'id': '2',
    'name': 'Test Product 2',
    'storeName': 'Test Store 2',
    'price': 199.99,
    'category': 'Fashion',
    'imageUrls': ['https://example.com/image2.jpg'],
  };

  static List<Map<String, dynamic>> get allProductsJson => [
    productJson1,
    productJson2,
  ];
}

/// Test error messages
class TestErrorMessages {
  static const cacheError = 'Failed to load from cache';
  static const networkError = 'No internet connection';
  static const serverError = 'Server error occurred';
  static const validationError = 'Validation failed';
  static const unknownError = 'Unknown error occurred';
}

/// Test categories
class TestCategories {
  static const electronics = 'Electronics';
  static const fashion = 'Fashion';
  static const home = 'Home';
  static const sports = 'Sports';

  static List<String> get all => [electronics, fashion, home, sports];
}
