import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_task/core/common/usecases/usecase.dart';
import 'package:products_task/core/errors/failures.dart';
import 'package:products_task/features/products/domain/entities/product.dart';
import 'package:products_task/features/products/domain/repositories/product_repository.dart';
import 'package:products_task/features/products/domain/usecases/get_products_usecase.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late GetProductsUsecase usecase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = GetProductsUsecase(mockRepository);
  });

  final testProducts = [
    const Product(
      id: '1',
      name: 'Product 1',
      storeName: 'Store 1',
      price: 99.99,
      category: 'Electronics',
      imageUrls: ['https://example.com/image1.jpg'],
    ),
    const Product(
      id: '2',
      name: 'Product 2',
      storeName: 'Store 2',
      price: 199.99,
      category: 'Fashion',
      imageUrls: ['https://example.com/image2.jpg'],
    ),
  ];

  test('should get products from the repository', () async {
    // arrange
    when(
      () => mockRepository.getProducts(),
    ).thenAnswer((_) async => Right(testProducts));

    // act
    final result = await usecase(const NoParams());

    // assert
    expect(result, equals(Right<Failure, List<Product>>(testProducts)));
    verify(() => mockRepository.getProducts()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when repository fails', () async {
    // arrange
    const failure = CacheFailure(message: 'Failed to load products');
    when(
      () => mockRepository.getProducts(),
    ).thenAnswer((_) async => const Left(failure));

    // act
    final result = await usecase(const NoParams());

    // assert
    expect(result, equals(const Left<Failure, List<Product>>(failure)));
    verify(() => mockRepository.getProducts()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return empty list when no products exist', () async {
    // arrange
    when(
      () => mockRepository.getProducts(),
    ).thenAnswer((_) async => const Right([]));

    // act
    final result = await usecase(const NoParams());

    // assert
    expect(result, equals(const Right<Failure, List<Product>>([])));
    result.fold(
      (_) => fail('Should return success'),
      (products) => expect(products, isEmpty),
    );
  });

  test('should handle NoParams correctly', () async {
    // arrange
    when(
      () => mockRepository.getProducts(),
    ).thenAnswer((_) async => Right(testProducts));

    // act
    final result = await usecase(const NoParams());

    // assert
    expect(result, isA<Right>());
    verify(() => mockRepository.getProducts()).called(1);
  });
}
