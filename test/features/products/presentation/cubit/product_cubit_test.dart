import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_task/core/common/usecases/usecase.dart';
import 'package:products_task/core/errors/failures.dart';
import 'package:products_task/core/helpers/bloc_status.dart';
import 'package:products_task/features/products/domain/entities/product.dart';
import 'package:products_task/features/products/domain/usecases/add_product_usecase.dart';
import 'package:products_task/features/products/domain/usecases/delete_product_usecase.dart';
import 'package:products_task/features/products/domain/usecases/get_products_usecase.dart';
import 'package:products_task/features/products/presentation/cubit/product_cubit.dart';

class MockGetProductsUsecase extends Mock implements GetProductsUsecase {}
class MockAddProductUsecase extends Mock implements AddProductUsecase {}
class MockDeleteProductUsecase extends Mock implements DeleteProductUsecase {}

void main() {
  late ProductCubit cubit;
  late MockGetProductsUsecase mockGetProductsUsecase;
  late MockAddProductUsecase mockAddProductUsecase;
  late MockDeleteProductUsecase mockDeleteProductUsecase;

  setUp(() {
    mockGetProductsUsecase = MockGetProductsUsecase();
    mockAddProductUsecase = MockAddProductUsecase();
    mockDeleteProductUsecase = MockDeleteProductUsecase();
    cubit = ProductCubit(
      getProductsUsecase: mockGetProductsUsecase,
      addProductUsecase: mockAddProductUsecase,
      deleteProductUsecase: mockDeleteProductUsecase,
    );
  });

  tearDown(() {
    cubit.close();
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

  setUpAll(() {
    registerFallbackValue(const NoParams());
    registerFallbackValue(const AddProductParams(
      product: Product(
        id: '1',
        name: 'Test',
        storeName: 'Test',
        price: 1.0,
        category: 'Test',
        imageUrls: [],
      ),
    ));
    registerFallbackValue(const DeleteProductParams(productId: '1'));
  });

  test('initial state should be correct', () {
    expect(cubit.state, equals(const ProductState()));
    expect(cubit.state.getProductsStatus.isInitial(), true);
    expect(cubit.state.addProductStatus.isInitial(), true);
    expect(cubit.state.selectedCategory, isNull);
  });

  group('loadProducts', () {
    test('should emit loading then success when products are loaded successfully', () async {
      // arrange
      when(() => mockGetProductsUsecase(any()))
          .thenAnswer((_) async => Right(testProducts));

      // assert later
      final expected = [
        const ProductState(getProductsStatus: BlocStatus.loading()),
        ProductState(getProductsStatus: BlocStatus.success(data: testProducts)),
      ];

      expectLater(cubit.stream, emitsInOrder(expected));

      // act
      await cubit.loadProducts();
    });

    test('should emit loading then empty when no products exist', () async {
      // arrange
      when(() => mockGetProductsUsecase(any()))
          .thenAnswer((_) async => const Right([]));

      // assert later
      final expected = [
        const ProductState(getProductsStatus: BlocStatus.loading()),
        const ProductState(getProductsStatus: BlocStatus.empty()),
      ];

      expectLater(cubit.stream, emitsInOrder(expected));

      // act
      await cubit.loadProducts();
    });

    test('should emit loading then failure when loading fails', () async {
      // arrange
      const failure = CacheFailure(message: 'Failed to load products');
      when(() => mockGetProductsUsecase(any()))
          .thenAnswer((_) async => const Left(failure));

      // assert later
      final expected = [
        const ProductState(getProductsStatus: BlocStatus.loading()),
        const ProductState(
          getProductsStatus: BlocStatus.fail(error: 'Failed to load products'),
        ),
      ];

      expectLater(cubit.stream, emitsInOrder(expected));

      // act
      await cubit.loadProducts();
    });

    test('should preserve existing data when loading', () async {
      // arrange
      when(() => mockGetProductsUsecase(any()))
          .thenAnswer((_) async => Right(testProducts));

      // act - first load
      await cubit.loadProducts();

      // arrange - second load
      when(() => mockGetProductsUsecase(any()))
          .thenAnswer((_) async => const Left(CacheFailure(message: 'Error')));

      // act - second load
      await cubit.loadProducts();

      // assert - data should still be present even after failure
      expect(cubit.state.getProductsStatus.data, equals(testProducts));
    });
  });

  group('addProductFromForm', () {
    const testProduct = Product(
      id: '1',
      name: 'Test Product',
      storeName: 'Test Store',
      price: 99.99,
      category: 'Electronics',
      imageUrls: ['https://example.com/image1.jpg'],
    );

    test('should return true and emit success when product is added successfully', () async {
      // arrange
      when(() => mockAddProductUsecase(any()))
          .thenAnswer((_) async => const Right(testProduct));
      when(() => mockGetProductsUsecase(any()))
          .thenAnswer((_) async => Right([testProduct]));

      // act
      final result = await cubit.addProductFromForm(
        name: 'Test Product',
        storeName: 'Test Store',
        price: 99.99,
        category: 'Electronics',
        imageUrls: ['https://example.com/image1.jpg'],
      );

      // assert
      expect(result, true);
      expect(cubit.state.addProductStatus.isSuccess(), true);
      verify(() => mockAddProductUsecase(any())).called(1);
      verify(() => mockGetProductsUsecase(any())).called(1);
    });

    test('should return false when validation fails with empty name', () async {
      // act
      final result = await cubit.addProductFromForm(
        name: '',
        storeName: 'Test Store',
        price: 99.99,
        category: 'Electronics',
      );

      // assert
      expect(result, false);
      expect(cubit.state.addProductStatus.isFailed(), true);
      verifyNever(() => mockAddProductUsecase(any()));
    });

    test('should return false when validation fails with empty store name', () async {
      // act
      final result = await cubit.addProductFromForm(
        name: 'Test Product',
        storeName: '',
        price: 99.99,
        category: 'Electronics',
      );

      // assert
      expect(result, false);
      expect(cubit.state.addProductStatus.isFailed(), true);
      verifyNever(() => mockAddProductUsecase(any()));
    });

    test('should return false when validation fails with empty category', () async {
      // act
      final result = await cubit.addProductFromForm(
        name: 'Test Product',
        storeName: 'Test Store',
        price: 99.99,
        category: '',
      );

      // assert
      expect(result, false);
      expect(cubit.state.addProductStatus.isFailed(), true);
      verifyNever(() => mockAddProductUsecase(any()));
    });

    test('should return false when validation fails with zero price', () async {
      // act
      final result = await cubit.addProductFromForm(
        name: 'Test Product',
        storeName: 'Test Store',
        price: 0,
        category: 'Electronics',
      );

      // assert
      expect(result, false);
      expect(cubit.state.addProductStatus.isFailed(), true);
      verifyNever(() => mockAddProductUsecase(any()));
    });

    test('should return false when validation fails with negative price', () async {
      // act
      final result = await cubit.addProductFromForm(
        name: 'Test Product',
        storeName: 'Test Store',
        price: -10,
        category: 'Electronics',
      );

      // assert
      expect(result, false);
      expect(cubit.state.addProductStatus.isFailed(), true);
      verifyNever(() => mockAddProductUsecase(any()));
    });

    test('should return false when add product usecase fails', () async {
      // arrange
      const failure = CacheFailure(message: 'Failed to add product');
      when(() => mockAddProductUsecase(any()))
          .thenAnswer((_) async => const Left(failure));

      // act
      final result = await cubit.addProductFromForm(
        name: 'Test Product',
        storeName: 'Test Store',
        price: 99.99,
        category: 'Electronics',
      );

      // assert
      expect(result, false);
      expect(cubit.state.addProductStatus.isFailed(), true);
      expect(cubit.state.addProductStatus.error, 'Failed to add product');
    });

    test('should use sample image URL when imageUrls is null', () async {
      // arrange
      when(() => mockAddProductUsecase(any()))
          .thenAnswer((_) async => const Right(testProduct));
      when(() => mockGetProductsUsecase(any()))
          .thenAnswer((_) async => Right([testProduct]));

      // act
      await cubit.addProductFromForm(
        name: 'Test Product',
        storeName: 'Test Store',
        price: 99.99,
        category: 'Electronics',
        imageUrls: null,
      );

      // assert
      final captured = verify(() => mockAddProductUsecase(captureAny())).captured;
      final params = captured.first as AddProductParams;
      expect(params.product.imageUrls, isNotEmpty);
    });

    test('should use sample image URL when imageUrls is empty', () async {
      // arrange
      when(() => mockAddProductUsecase(any()))
          .thenAnswer((_) async => const Right(testProduct));
      when(() => mockGetProductsUsecase(any()))
          .thenAnswer((_) async => Right([testProduct]));

      // act
      await cubit.addProductFromForm(
        name: 'Test Product',
        storeName: 'Test Store',
        price: 99.99,
        category: 'Electronics',
        imageUrls: [],
      );

      // assert
      final captured = verify(() => mockAddProductUsecase(captureAny())).captured;
      final params = captured.first as AddProductParams;
      expect(params.product.imageUrls, isNotEmpty);
    });
  });

  group('filterByCategory', () {
    test('should update selectedCategory when filtering', () {
      // act
      cubit.filterByCategory('Electronics');

      // assert
      expect(cubit.state.selectedCategory, 'Electronics');
    });

    test('should clear category when null is passed', () {
      // arrange - first set a category
      cubit.filterByCategory('Electronics');
      expect(cubit.state.selectedCategory, 'Electronics');

      // act
      cubit.filterByCategory(null);

      // assert
      expect(cubit.state.selectedCategory, isNull);
    });

    test('should emit new state when category changes', () {
      // assert later
      expectLater(
        cubit.stream,
        emitsInOrder([
          const ProductState(selectedCategory: 'Fashion'),
          const ProductState(selectedCategory: 'Electronics'),
        ]),
      );

      // act
      cubit.filterByCategory('Fashion');
      cubit.filterByCategory('Electronics');
    });
  });

  group('getFilteredProducts', () {
    setUp(() {
      // Setup state with products
      when(() => mockGetProductsUsecase(any()))
          .thenAnswer((_) async => Right(testProducts));
    });

    test('should return all products when no category is selected', () async {
      // arrange
      await cubit.loadProducts();

      // act
      final result = cubit.getFilteredProducts();

      // assert
      expect(result, equals(testProducts));
    });

    test('should return filtered products when category is selected', () async {
      // arrange
      await cubit.loadProducts();
      cubit.filterByCategory('Electronics');

      // act
      final result = cubit.getFilteredProducts();

      // assert
      expect(result.length, 1);
      expect(result.first.category, 'Electronics');
    });

    test('should return empty list when category has no products', () async {
      // arrange
      await cubit.loadProducts();
      cubit.filterByCategory('NonExistentCategory');

      // act
      final result = cubit.getFilteredProducts();

      // assert
      expect(result, isEmpty);
    });

    test('should return empty list when products are not loaded', () {
      // act
      final result = cubit.getFilteredProducts();

      // assert
      expect(result, isEmpty);
    });
  });
}

