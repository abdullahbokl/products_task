import 'package:dartz/dartz.dart';

import '../../errors/failures.dart';

/// Base class for all use cases in the application
/// Returns Either<Failure, T> for proper error handling
abstract class Usecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

/// Class to be used when a usecase doesn't need any parameters
class NoParams {
  const NoParams();
}
