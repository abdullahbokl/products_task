part of 'product_cubit.dart';

class ProductState extends Equatable {
  final BlocStatus<List<Product>> getProductsStatus;
  final BlocStatus<Product?> addProductStatus;
  final String? selectedCategory; // null means "all categories"

  const ProductState({
    this.getProductsStatus = const BlocStatus.initial(),
    this.addProductStatus = const BlocStatus.initial(),
    this.selectedCategory,
  });

  ProductState copyWith({
    BlocStatus<List<Product>>? getProductsStatus,
    BlocStatus<Product?>? addProductStatus,
    String? selectedCategory,
    bool clearCategory = false,
  }) {
    return ProductState(
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      addProductStatus: addProductStatus ?? this.addProductStatus,
      selectedCategory: clearCategory ? null : (selectedCategory ?? this.selectedCategory),
    );
  }

  @override
  List<Object?> get props => [
        getProductsStatus,
        addProductStatus,
        selectedCategory,
      ];
}
