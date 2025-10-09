import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({
    required this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

/// Cache failure when local data operations fail
class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.statusCode});
}

/// Server failure when API calls fail
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});
}

/// Validation failure when input validation fails
class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
}

/// Network failure when there's no internet connection
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

/// Unknown failure for unexpected errors
class UnknownFailure extends Failure {
  const UnknownFailure({required super.message});
}

