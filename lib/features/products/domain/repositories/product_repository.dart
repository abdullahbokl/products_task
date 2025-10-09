import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> addProduct(Product product);
  Future<void> deleteProduct(String productId);
  Future<Product> updateProduct(Product product);
}
