import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product_model.dart';

abstract class LocalProductDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> addProduct(ProductModel product);
  Future<void> deleteProduct(String productId);
  Future<ProductModel> updateProduct(ProductModel product);
}

class LocalProductDataSourceImpl implements LocalProductDataSource {
  List<ProductModel> _products = [];

  @override
  Future<List<ProductModel>> getProducts() async {
    if (_products.isEmpty) {
      final String response = await rootBundle.loadString('assets/data/products.json');
      final List<dynamic> data = json.decode(response);
      _products = data.map((json) => ProductModel.fromJson(json)).toList();
    }
    return _products;
  }

  @override
  Future<ProductModel> addProduct(ProductModel product) async {
    _products.insert(0, product);
    return product;
  }

  @override
  Future<void> deleteProduct(String productId) async {
    _products.removeWhere((product) => product.id == productId);
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
    }
    return product;
  }
}
