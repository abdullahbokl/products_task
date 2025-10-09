import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/local_product_datasource.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final LocalProductDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await dataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to load products: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Product>> addProduct(Product product) async {
    try {
      final productModel = ProductModel.fromEntity(product);
      final addedProduct = await dataSource.addProduct(productModel);
      return Right(addedProduct);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to add product: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String productId) async {
    try {
      await dataSource.deleteProduct(productId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to delete product: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
    try {
      final productModel = ProductModel.fromEntity(product);
      final updatedProduct = await dataSource.updateProduct(productModel);
      return Right(updatedProduct);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to update product: ${e.toString()}'));
    }
  }
}
