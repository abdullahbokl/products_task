import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String storeName;
  final double price;
  final String category;
  final List<String> imageUrls;

  const Product({
    required this.id,
    required this.name,
    required this.storeName,
    required this.price,
    required this.category,
    required this.imageUrls,
  });

  Product copyWith({
    String? id,
    String? name,
    String? storeName,
    double? price,
    String? category,
    List<String>? imageUrls,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      storeName: storeName ?? this.storeName,
      price: price ?? this.price,
      category: category ?? this.category,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  @override
  List<Object?> get props => [id, name, storeName, price, category, imageUrls];
}
