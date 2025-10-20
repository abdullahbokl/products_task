import 'package:flutter_test/flutter_test.dart';
import 'package:products_task/features/products/domain/entities/product.dart';

void main() {
  group('Product Entity', () {
    const testProduct = Product(
      id: '1',
      name: 'Test Product',
      storeName: 'Test Store',
      price: 99.99,
      category: 'Electronics',
      imageUrls: ['https://example.com/image1.jpg'],
    );

    test('should be a subclass of Equatable', () {
      expect(testProduct, isA<Product>());
    });

    test('should have correct props for equality comparison', () {
      const product1 = Product(
        id: '1',
        name: 'Test Product',
        storeName: 'Test Store',
        price: 99.99,
        category: 'Electronics',
        imageUrls: ['https://example.com/image1.jpg'],
      );

      const product2 = Product(
        id: '1',
        name: 'Test Product',
        storeName: 'Test Store',
        price: 99.99,
        category: 'Electronics',
        imageUrls: ['https://example.com/image1.jpg'],
      );

      expect(product1, equals(product2));
    });

    test('should not be equal when properties differ', () {
      const product1 = Product(
        id: '1',
        name: 'Test Product',
        storeName: 'Test Store',
        price: 99.99,
        category: 'Electronics',
        imageUrls: ['https://example.com/image1.jpg'],
      );

      const product2 = Product(
        id: '2',
        name: 'Different Product',
        storeName: 'Test Store',
        price: 99.99,
        category: 'Electronics',
        imageUrls: ['https://example.com/image1.jpg'],
      );

      expect(product1, isNot(equals(product2)));
    });

    test('copyWith should return a new product with updated values', () {
      final updatedProduct = testProduct.copyWith(
        name: 'Updated Product',
        price: 199.99,
      );

      expect(updatedProduct.id, testProduct.id);
      expect(updatedProduct.name, 'Updated Product');
      expect(updatedProduct.price, 199.99);
      expect(updatedProduct.storeName, testProduct.storeName);
      expect(updatedProduct.category, testProduct.category);
      expect(updatedProduct.imageUrls, testProduct.imageUrls);
    });

    test('copyWith with no parameters should return identical product', () {
      final copiedProduct = testProduct.copyWith();

      expect(copiedProduct, equals(testProduct));
    });

    test('copyWith should allow updating imageUrls', () {
      final updatedProduct = testProduct.copyWith(
        imageUrls: ['https://example.com/new-image.jpg'],
      );

      expect(updatedProduct.imageUrls, ['https://example.com/new-image.jpg']);
      expect(updatedProduct.imageUrls, isNot(equals(testProduct.imageUrls)));
    });
  });
}

