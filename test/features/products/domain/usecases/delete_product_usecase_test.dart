import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_task/core/errors/failures.dart';
import 'package:products_task/features/products/domain/repositories/product_repository.dart';
import 'package:products_task/features/products/domain/usecases/delete_product_usecase.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late DeleteProductUsecase usecase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = DeleteProductUsecase(mockRepository);
  });

  const testProductId = '1';
  const testParams = DeleteProductParams(productId: testProductId);

  test('should delete product through the repository', () async {
    // arrange
    when(
      () => mockRepository.deleteProduct(any()),
    ).thenAnswer((_) async => const Right(null));

    // act
    final result = await usecase(testParams);

    // assert
    expect(result, equals(const Right<Failure, void>(null)));
    verify(() => mockRepository.deleteProduct(testProductId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure when repository fails', () async {
    // arrange
    const failure = CacheFailure(message: 'Failed to delete product');
    when(
      () => mockRepository.deleteProduct(any()),
    ).thenAnswer((_) async => const Left(failure));

    // act
    final result = await usecase(testParams);

    // assert
    expect(result, equals(const Left<Failure, void>(failure)));
    verify(() => mockRepository.deleteProduct(testProductId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should pass correct product id to repository', () async {
    // arrange
    when(
      () => mockRepository.deleteProduct(any()),
    ).thenAnswer((_) async => const Right(null));

    // act
    await usecase(testParams);

    // assert
    final captured = verify(
      () => mockRepository.deleteProduct(captureAny()),
    ).captured;
    expect(captured.first, equals(testProductId));
  });

  group('DeleteProductParams', () {
    test('should have correct props for equality', () {
      const params1 = DeleteProductParams(productId: '1');
      const params2 = DeleteProductParams(productId: '1');

      expect(params1, equals(params2));
    });

    test('should not be equal with different product ids', () {
      const params1 = DeleteProductParams(productId: '1');
      const params2 = DeleteProductParams(productId: '2');

      expect(params1, isNot(equals(params2)));
    });
  });
}
