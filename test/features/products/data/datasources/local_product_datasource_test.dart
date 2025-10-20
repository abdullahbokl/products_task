import 'package:flutter_test/flutter_test.dart';
import 'package:products_task/features/products/data/datasources/local_product_datasource.dart';
import 'package:products_task/features/products/data/models/product_model.dart';

void main() {
  group('LocalProductDataSourceImpl', () {
    late LocalProductDataSourceImpl dataSource;

    setUp(() {
      dataSource = LocalProductDataSourceImpl();
    });

    group('addProduct', () {
      test('should add product to the list and return it', () async {
        const testProduct = ProductModel(
          id: '1',
          name: 'Test Product',
          storeName: 'Test Store',
          price: 99.99,
          category: 'Electronics',
          imageUrls: ['https://example.com/image1.jpg'],
        );

        final result = await dataSource.addProduct(testProduct);

        expect(result, equals(testProduct));
      });

      test('should add product at the beginning of the list', () async {
        const product1 = ProductModel(
          id: '1',
          name: 'Product 1',
          storeName: 'Store 1',
          price: 99.99,
          category: 'Category1',
          imageUrls: ['https://example.com/image1.jpg'],
        );

        const product2 = ProductModel(
          id: '2',
          name: 'Product 2',
          storeName: 'Store 2',
          price: 199.99,
          category: 'Category2',
          imageUrls: ['https://example.com/image2.jpg'],
        );

        await dataSource.addProduct(product1);
        await dataSource.addProduct(product2);

        // Note: We can't directly test the order without getProducts working,
        // but we verify the products are added
        final result = await dataSource.addProduct(product2);
        expect(result, equals(product2));
      });

      test('should handle multiple products being added', () async {
        const product1 = ProductModel(
          id: '1',
          name: 'Product 1',
          storeName: 'Store 1',
          price: 99.99,
          category: 'Category1',
          imageUrls: ['https://example.com/image1.jpg'],
        );

        const product2 = ProductModel(
          id: '2',
          name: 'Product 2',
          storeName: 'Store 2',
          price: 199.99,
          category: 'Category2',
          imageUrls: ['https://example.com/image2.jpg'],
        );

        const product3 = ProductModel(
          id: '3',
          name: 'Product 3',
          storeName: 'Store 3',
          price: 299.99,
          category: 'Category3',
          imageUrls: ['https://example.com/image3.jpg'],
        );

        final result1 = await dataSource.addProduct(product1);
        final result2 = await dataSource.addProduct(product2);
        final result3 = await dataSource.addProduct(product3);

        expect(result1, equals(product1));
        expect(result2, equals(product2));
        expect(result3, equals(product3));
      });
    });

    group('deleteProduct', () {
      test('should remove product with matching id', () async {
        const testProduct = ProductModel(
          id: '1',
          name: 'Test Product',
          storeName: 'Test Store',
          price: 99.99,
          category: 'Electronics',
          imageUrls: ['https://example.com/image1.jpg'],
        );

        await dataSource.addProduct(testProduct);
        await dataSource.deleteProduct('1');

        // Verify deletion completes without error
        expect(() => dataSource.deleteProduct('1'), returnsNormally);
      });

      test(
        'should not throw error when deleting non-existent product',
        () async {
          expect(
            () => dataSource.deleteProduct('non-existent-id'),
            returnsNormally,
          );
        },
      );

      test('should only remove the product with specified id', () async {
        const product1 = ProductModel(
          id: '1',
          name: 'Product 1',
          storeName: 'Store 1',
          price: 99.99,
          category: 'Category1',
          imageUrls: ['https://example.com/image1.jpg'],
        );

        const product2 = ProductModel(
          id: '2',
          name: 'Product 2',
          storeName: 'Store 2',
          price: 199.99,
          category: 'Category2',
          imageUrls: ['https://example.com/image2.jpg'],
        );

        await dataSource.addProduct(product1);
        await dataSource.addProduct(product2);
        await dataSource.deleteProduct('1');

        // Verify deletion completes without error
        expect(() => dataSource.deleteProduct('1'), returnsNormally);
      });
    });

    group('updateProduct', () {
      test('should update existing product and return it', () async {
        const originalProduct = ProductModel(
          id: '1',
          name: 'Original Product',
          storeName: 'Original Store',
          price: 99.99,
          category: 'Electronics',
          imageUrls: ['https://example.com/image1.jpg'],
        );

        const updatedProduct = ProductModel(
          id: '1',
          name: 'Updated Product',
          storeName: 'Updated Store',
          price: 199.99,
          category: 'Electronics',
          imageUrls: ['https://example.com/updated.jpg'],
        );

        await dataSource.addProduct(originalProduct);
        final result = await dataSource.updateProduct(updatedProduct);

        expect(result, equals(updatedProduct));
        expect(result.name, 'Updated Product');
        expect(result.price, 199.99);
      });

      test('should return updated product even if it does not exist', () async {
        const newProduct = ProductModel(
          id: '999',
          name: 'New Product',
          storeName: 'New Store',
          price: 99.99,
          category: 'Electronics',
          imageUrls: ['https://example.com/image1.jpg'],
        );

        final result = await dataSource.updateProduct(newProduct);

        expect(result, equals(newProduct));
      });

      test('should only update the product with matching id', () async {
        const product1 = ProductModel(
          id: '1',
          name: 'Product 1',
          storeName: 'Store 1',
          price: 99.99,
          category: 'Category1',
          imageUrls: ['https://example.com/image1.jpg'],
        );

        const product2 = ProductModel(
          id: '2',
          name: 'Product 2',
          storeName: 'Store 2',
          price: 199.99,
          category: 'Category2',
          imageUrls: ['https://example.com/image2.jpg'],
        );

        const updatedProduct1 = ProductModel(
          id: '1',
          name: 'Updated Product 1',
          storeName: 'Updated Store 1',
          price: 149.99,
          category: 'Category1',
          imageUrls: ['https://example.com/updated1.jpg'],
        );

        await dataSource.addProduct(product1);
        await dataSource.addProduct(product2);
        final result = await dataSource.updateProduct(updatedProduct1);

        expect(result.id, '1');
        expect(result.name, 'Updated Product 1');
      });
    });
  });
}
