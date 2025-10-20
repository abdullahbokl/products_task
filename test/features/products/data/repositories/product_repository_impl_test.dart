import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_task/core/errors/failures.dart';
import 'package:products_task/features/products/data/datasources/local_product_datasource.dart';
import 'package:products_task/features/products/data/models/product_model.dart';
import 'package:products_task/features/products/data/repositories/product_repository_impl.dart';
import 'package:products_task/features/products/domain/entities/product.dart';

class MockLocalProductDataSource extends Mock
    implements LocalProductDataSource {}

void main() {
  late ProductRepositoryImpl repository;
  late MockLocalProductDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockLocalProductDataSource();
    repository = ProductRepositoryImpl(mockDataSource);
  });

  group('getProducts', () {
    final testProductModels = [
      const ProductModel(
        id: '1',
        name: 'Product 1',
        storeName: 'Store 1',
        price: 99.99,
        category: 'Electronics',
        imageUrls: ['https://example.com/image1.jpg'],
      ),
      const ProductModel(
        id: '2',
        name: 'Product 2',
        storeName: 'Store 2',
        price: 199.99,
        category: 'Fashion',
        imageUrls: ['https://example.com/image2.jpg'],
      ),
    ];

    test(
      'should return list of products when call to data source is successful',
      () async {
        // arrange
        when(
          () => mockDataSource.getProducts(),
        ).thenAnswer((_) async => testProductModels);

        // act
        final result = await repository.getProducts();

        // assert
        expect(
          result,
          equals(Right<Failure, List<Product>>(testProductModels)),
        );
        verify(() => mockDataSource.getProducts()).called(1);
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return CacheFailure when data source throws exception',
      () async {
        // arrange
        when(
          () => mockDataSource.getProducts(),
        ).thenThrow(Exception('Cache error'));

        // act
        final result = await repository.getProducts();

        // assert
        expect(result, isA<Left>());
        result.fold((failure) {
          expect(failure, isA<CacheFailure>());
          expect(failure.message, contains('Failed to load products'));
        }, (_) => fail('Should return failure'));
        verify(() => mockDataSource.getProducts()).called(1);
      },
    );

    test('should return empty list when no products exist', () async {
      // arrange
      when(() => mockDataSource.getProducts()).thenAnswer((_) async => []);

      // act
      final result = await repository.getProducts();

      // assert: ensure result is Right and data is an empty list
      expect(result.isRight(), true);
      result.fold(
        (_) => fail('Expected success but got failure'),
        (products) => expect(products, isEmpty),
      );
      verify(() => mockDataSource.getProducts()).called(1);
    });
  });

  group('addProduct', () {
    const testProduct = Product(
      id: '1',
      name: 'Test Product',
      storeName: 'Test Store',
      price: 99.99,
      category: 'Electronics',
      imageUrls: ['https://example.com/image1.jpg'],
    );

    const testProductModel = ProductModel(
      id: '1',
      name: 'Test Product',
      storeName: 'Test Store',
      price: 99.99,
      category: 'Electronics',
      imageUrls: ['https://example.com/image1.jpg'],
    );

    setUp(() {
      registerFallbackValue(testProductModel);
    });

    test(
      'should return product when call to data source is successful',
      () async {
        // arrange
        when(
          () => mockDataSource.addProduct(any()),
        ).thenAnswer((_) async => testProductModel);

        // act
        final result = await repository.addProduct(testProduct);

        // assert
        expect(result, equals(const Right<Failure, Product>(testProductModel)));
        verify(() => mockDataSource.addProduct(any())).called(1);
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return CacheFailure when data source throws exception',
      () async {
        // arrange
        when(
          () => mockDataSource.addProduct(any()),
        ).thenThrow(Exception('Failed to add'));

        // act
        final result = await repository.addProduct(testProduct);

        // assert
        expect(result, isA<Left>());
        result.fold((failure) {
          expect(failure, isA<CacheFailure>());
          expect(failure.message, contains('Failed to add product'));
        }, (_) => fail('Should return failure'));
        verify(() => mockDataSource.addProduct(any())).called(1);
      },
    );

    test(
      'should convert Product entity to ProductModel before adding',
      () async {
        // arrange
        when(
          () => mockDataSource.addProduct(any()),
        ).thenAnswer((_) async => testProductModel);

        // act
        await repository.addProduct(testProduct);

        // assert
        final captured = verify(
          () => mockDataSource.addProduct(captureAny()),
        ).captured;
        expect(captured.first, isA<ProductModel>());
        expect((captured.first as ProductModel).id, testProduct.id);
      },
    );
  });

  group('deleteProduct', () {
    const testProductId = '1';

    test('should return Right(null) when deletion is successful', () async {
      // arrange
      when(
        () => mockDataSource.deleteProduct(any()),
      ).thenAnswer((_) async => Future.value());

      // act
      final result = await repository.deleteProduct(testProductId);

      // assert
      expect(result, equals(const Right<Failure, void>(null)));
      verify(() => mockDataSource.deleteProduct(testProductId)).called(1);
      verifyNoMoreInteractions(mockDataSource);
    });

    test(
      'should return CacheFailure when data source throws exception',
      () async {
        // arrange
        when(
          () => mockDataSource.deleteProduct(any()),
        ).thenThrow(Exception('Failed to delete'));

        // act
        final result = await repository.deleteProduct(testProductId);

        // assert
        expect(result, isA<Left>());
        result.fold((failure) {
          expect(failure, isA<CacheFailure>());
          expect(failure.message, contains('Failed to delete product'));
        }, (_) => fail('Should return failure'));
        verify(() => mockDataSource.deleteProduct(testProductId)).called(1);
      },
    );

    test('should pass correct product id to data source', () async {
      // arrange
      when(
        () => mockDataSource.deleteProduct(any()),
      ).thenAnswer((_) async => Future.value());

      // act
      await repository.deleteProduct(testProductId);

      // assert
      verify(() => mockDataSource.deleteProduct(testProductId)).called(1);
    });
  });

  group('updateProduct', () {
    const testProduct = Product(
      id: '1',
      name: 'Updated Product',
      storeName: 'Updated Store',
      price: 149.99,
      category: 'Electronics',
      imageUrls: ['https://example.com/updated.jpg'],
    );

    const testProductModel = ProductModel(
      id: '1',
      name: 'Updated Product',
      storeName: 'Updated Store',
      price: 149.99,
      category: 'Electronics',
      imageUrls: ['https://example.com/updated.jpg'],
    );

    setUp(() {
      registerFallbackValue(testProductModel);
    });

    test(
      'should return updated product when call to data source is successful',
      () async {
        // arrange
        when(
          () => mockDataSource.updateProduct(any()),
        ).thenAnswer((_) async => testProductModel);

        // act
        final result = await repository.updateProduct(testProduct);

        // assert
        expect(result, equals(const Right<Failure, Product>(testProductModel)));
        verify(() => mockDataSource.updateProduct(any())).called(1);
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return CacheFailure when data source throws exception',
      () async {
        // arrange
        when(
          () => mockDataSource.updateProduct(any()),
        ).thenThrow(Exception('Failed to update'));

        // act
        final result = await repository.updateProduct(testProduct);

        // assert
        expect(result, isA<Left>());
        result.fold((failure) {
          expect(failure, isA<CacheFailure>());
          expect(failure.message, contains('Failed to update product'));
        }, (_) => fail('Should return failure'));
        verify(() => mockDataSource.updateProduct(any())).called(1);
      },
    );

    test(
      'should convert Product entity to ProductModel before updating',
      () async {
        // arrange
        when(
          () => mockDataSource.updateProduct(any()),
        ).thenAnswer((_) async => testProductModel);

        // act
        await repository.updateProduct(testProduct);

        // assert
        final captured = verify(
          () => mockDataSource.updateProduct(captureAny()),
        ).captured;
        expect(captured.first, isA<ProductModel>());
        expect((captured.first as ProductModel).id, testProduct.id);
        expect((captured.first as ProductModel).name, testProduct.name);
      },
    );
  });
}
