import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/common/usecases/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/product_repository.dart';

class DeleteProduct implements Usecase<void, DeleteProductParams> {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteProductParams params) async {
    return await repository.deleteProduct(params.productId);
  }
}

class DeleteProductParams extends Equatable {
  final String productId;

  const DeleteProductParams({required this.productId});

  @override
  List<Object?> get props => [productId];
}
