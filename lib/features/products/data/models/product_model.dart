import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.storeName,
    required super.price,
    required super.category,
    required super.imageUrls,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      storeName: json['storeName'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      imageUrls: List<String>.from(json['imageUrls'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'storeName': storeName,
      'price': price,
      'category': category,
      'imageUrls': imageUrls,
    };
  }

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      storeName: product.storeName,
      price: product.price,
      category: product.category,
      imageUrls: product.imageUrls,
    );
  }
}
