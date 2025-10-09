import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/common/usecases/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class AddProductUsecase implements Usecase<Product, AddProductParams> {
  final ProductRepository repository;

  AddProductUsecase(this.repository);

  @override
  Future<Either<Failure, Product>> call(AddProductParams params) async {
    return await repository.addProduct(params.product);
  }
}

class AddProductParams extends Equatable {
  final Product product;

  const AddProductParams({required this.product});

  @override
  List<Object?> get props => [product];
}
