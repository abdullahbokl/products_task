import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> addProduct(Product product);
  Future<Either<Failure, void>> deleteProduct(String productId);
  Future<Either<Failure, Product>> updateProduct(Product product);
}
