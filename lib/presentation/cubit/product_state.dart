part of 'product_cubit.dart';

class ProductState extends Equatable {
  final BlocStatus<List<Product>> status;

  const ProductState({required this.status});

  const ProductState._(this.status);

  factory ProductState.initial() => const ProductState(status: BlocStatus.initial());

  factory ProductState.loading({List<Product>? data}) => ProductState(status: BlocStatus.loading(data: data));

  factory ProductState.success(List<Product> products) => ProductState(status: BlocStatus.success(data: products));

  factory ProductState.empty() => const ProductState(status: BlocStatus.empty());

  factory ProductState.failure(String error, {List<Product>? data}) => ProductState(status: BlocStatus.fail(error: error, data: data));

  @override
  List<Object?> get props => [status];
}
