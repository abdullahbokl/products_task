part of 'product_cubit.dart';

class ProductState extends Equatable {
  final BlocStatus<List<Product>> getProductsStatus;
  final BlocStatus<Product?> addProductStatus;

  const ProductState({
    this.getProductsStatus = const BlocStatus.initial(),
    this.addProductStatus = const BlocStatus.initial(),
  });

  ProductState copyWith({
    BlocStatus<List<Product>>? getProductsStatus,
    BlocStatus<Product?>? addProductStatus,
  }) {
    return ProductState(
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      addProductStatus: addProductStatus ?? this.addProductStatus,
    );
  }

  @override
  List<Object> get props => [
        getProductsStatus,
        addProductStatus,
      ];
}
