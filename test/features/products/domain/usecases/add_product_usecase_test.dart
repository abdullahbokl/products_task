import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_task/core/errors/failures.dart';
import 'package:products_task/features/products/domain/entities/product.dart';
import 'package:products_task/features/products/domain/repositories/product_repository.dart';
import 'package:products_task/features/products/domain/usecases/add_product_usecase.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late AddProductUsecase usecase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = AddProductUsecase(mockRepository);
  });

  const testProduct = Product(
    id: '1',
    name: 'Test Product',
    storeName: 'Test Store',
    price: 99.99,
    category: 'Electronics',
    imageUrls: ['https://example.com/image1.jpg'],
  );

  const testParams = AddProductParams(product: testProduct);

  setUpAll(() {
    registerFallbackValue(testProduct);
  });

  test('should add product through the repository', () async {
    // arrange
    when(
      () => mockRepository.addProduct(any()),
    ).thenAnswer((_) async => const Right(testProduct));

    // act
    final result = await usecase(testParams);

    // assert
    expect(result, equals(const Right<Failure, Product>(testProduct)));
    verify(() => mockRepository.addProduct(testProduct)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when repository fails', () async {
    // arrange
    const failure = CacheFailure(message: 'Failed to add product');
    when(
      () => mockRepository.addProduct(any()),
    ).thenAnswer((_) async => const Left(failure));

    // act
    final result = await usecase(testParams);

    // assert
    expect(result, equals(const Left<Failure, Product>(failure)));
    verify(() => mockRepository.addProduct(testProduct)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should pass correct product to repository', () async {
    // arrange
    when(
      () => mockRepository.addProduct(any()),
    ).thenAnswer((_) async => const Right(testProduct));

    // act
    await usecase(testParams);

    // assert
    final captured = verify(
      () => mockRepository.addProduct(captureAny()),
    ).captured;
    expect(captured.first, equals(testProduct));
  });

  group('AddProductParams', () {
    test('should have correct props for equality', () {
      const params1 = AddProductParams(product: testProduct);
      const params2 = AddProductParams(product: testProduct);

      expect(params1, equals(params2));
    });

    test('should not be equal with different products', () {
      const product2 = Product(
        id: '2',
        name: 'Different Product',
        storeName: 'Different Store',
        price: 199.99,
        category: 'Fashion',
        imageUrls: ['https://example.com/image2.jpg'],
      );

      const params1 = AddProductParams(product: testProduct);
      const params2 = AddProductParams(product: product2);

      expect(params1, isNot(equals(params2)));
    });
  });
}
