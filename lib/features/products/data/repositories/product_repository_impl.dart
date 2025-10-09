import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/local_product_datasource.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final LocalProductDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<List<Product>> getProducts() async {
    final products = await dataSource.getProducts();
    return products;
  }

  @override
  Future<Product> addProduct(Product product) async {
    final productModel = ProductModel.fromEntity(product);
    final addedProduct = await dataSource.addProduct(productModel);
    return addedProduct;
  }

  @override
  Future<void> deleteProduct(String productId) async {
    await dataSource.deleteProduct(productId);
  }

  @override
  Future<Product> updateProduct(Product product) async {
    final productModel = ProductModel.fromEntity(product);
    final updatedProduct = await dataSource.updateProduct(productModel);
    return updatedProduct;
  }
}
