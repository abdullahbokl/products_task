import 'package:flutter_test/flutter_test.dart';
import 'package:products_task/features/products/data/models/product_model.dart';
import 'package:products_task/features/products/domain/entities/product.dart';

void main() {
  group('ProductModel', () {
    const testProductModel = ProductModel(
      id: '1',
      name: 'Test Product',
      storeName: 'Test Store',
      price: 99.99,
      category: 'Electronics',
      imageUrls: ['https://example.com/image1.jpg'],
    );

    const testJson = {
      'id': '1',
      'name': 'Test Product',
      'storeName': 'Test Store',
      'price': 99.99,
      'category': 'Electronics',
      'imageUrls': ['https://example.com/image1.jpg'],
    };

    test('should be a subclass of Product entity', () {
      expect(testProductModel, isA<Product>());
    });

    group('fromJson', () {
      test('should return a valid ProductModel from JSON', () {
        final result = ProductModel.fromJson(testJson);

        expect(result, equals(testProductModel));
      });

      test('should handle integer price and convert to double', () {
        final jsonWithIntPrice = {
          'id': '1',
          'name': 'Test Product',
          'storeName': 'Test Store',
          'price': 100,
          'category': 'Electronics',
          'imageUrls': ['https://example.com/image1.jpg'],
        };

        final result = ProductModel.fromJson(jsonWithIntPrice);

        expect(result.price, 100.0);
        expect(result.price, isA<double>());
      });

      test('should parse empty imageUrls list correctly', () {
        final jsonWithEmptyImages = {
          'id': '1',
          'name': 'Test Product',
          'storeName': 'Test Store',
          'price': 99.99,
          'category': 'Electronics',
          'imageUrls': [],
        };

        final result = ProductModel.fromJson(jsonWithEmptyImages);

        expect(result.imageUrls, isEmpty);
      });

      test('should parse multiple imageUrls correctly', () {
        final jsonWithMultipleImages = {
          'id': '1',
          'name': 'Test Product',
          'storeName': 'Test Store',
          'price': 99.99,
          'category': 'Electronics',
          'imageUrls': [
            'https://example.com/image1.jpg',
            'https://example.com/image2.jpg',
            'https://example.com/image3.jpg',
          ],
        };

        final result = ProductModel.fromJson(jsonWithMultipleImages);

        expect(result.imageUrls.length, 3);
        expect(result.imageUrls[0], 'https://example.com/image1.jpg');
        expect(result.imageUrls[1], 'https://example.com/image2.jpg');
        expect(result.imageUrls[2], 'https://example.com/image3.jpg');
      });
    });

    group('toJson', () {
      test('should return a JSON map containing proper data', () {
        final result = testProductModel.toJson();

        expect(result, equals(testJson));
      });

      test('should preserve all fields in JSON conversion', () {
        final json = testProductModel.toJson();

        expect(json['id'], testProductModel.id);
        expect(json['name'], testProductModel.name);
        expect(json['storeName'], testProductModel.storeName);
        expect(json['price'], testProductModel.price);
        expect(json['category'], testProductModel.category);
        expect(json['imageUrls'], testProductModel.imageUrls);
      });

      test('should handle empty imageUrls in toJson', () {
        const modelWithEmptyImages = ProductModel(
          id: '1',
          name: 'Test Product',
          storeName: 'Test Store',
          price: 99.99,
          category: 'Electronics',
          imageUrls: [],
        );

        final json = modelWithEmptyImages.toJson();

        expect(json['imageUrls'], isEmpty);
        expect(json['imageUrls'], isA<List>());
      });
    });

    group('fromEntity', () {
      test('should create ProductModel from Product entity', () {
        const product = Product(
          id: '1',
          name: 'Test Product',
          storeName: 'Test Store',
          price: 99.99,
          category: 'Electronics',
          imageUrls: ['https://example.com/image1.jpg'],
        );

        final result = ProductModel.fromEntity(product);

        expect(result.id, product.id);
        expect(result.name, product.name);
        expect(result.storeName, product.storeName);
        expect(result.price, product.price);
        expect(result.category, product.category);
        expect(result.imageUrls, product.imageUrls);
      });

      test('should preserve all entity properties', () {
        const product = Product(
          id: '123',
          name: 'Laptop',
          storeName: 'Tech Store',
          price: 1299.99,
          category: 'Computers',
          imageUrls: [
            'https://example.com/laptop1.jpg',
            'https://example.com/laptop2.jpg',
          ],
        );

        final result = ProductModel.fromEntity(product);

        // Compare fields instead of expecting equality between different types
        expect(result.id, product.id);
        expect(result.name, product.name);
        expect(result.storeName, product.storeName);
        expect(result.price, product.price);
        expect(result.category, product.category);
        expect(result.imageUrls, product.imageUrls);
      });
    });

    group('JSON round-trip', () {
      test('should maintain data integrity in fromJson -> toJson cycle', () {
        final model = ProductModel.fromJson(testJson);
        final json = model.toJson();

        expect(json, equals(testJson));
      });

      test('should maintain data integrity in toJson -> fromJson cycle', () {
        final json = testProductModel.toJson();
        final model = ProductModel.fromJson(json);

        expect(model, equals(testProductModel));
      });
    });
  });
}
