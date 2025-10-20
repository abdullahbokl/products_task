import 'package:flutter_test/flutter_test.dart';
import 'package:products_task/core/errors/failures.dart';

void main() {
  group('Failure', () {
    group('CacheFailure', () {
      test('should have correct message and statusCode', () {
        const failure = CacheFailure(message: 'Cache error', statusCode: 500);

        expect(failure.message, 'Cache error');
        expect(failure.statusCode, 500);
      });

      test('should be equal with same properties', () {
        const failure1 = CacheFailure(message: 'Cache error');
        const failure2 = CacheFailure(message: 'Cache error');

        expect(failure1, equals(failure2));
      });

      test('should not be equal with different properties', () {
        const failure1 = CacheFailure(message: 'Cache error 1');
        const failure2 = CacheFailure(message: 'Cache error 2');

        expect(failure1, isNot(equals(failure2)));
      });
    });

    group('ServerFailure', () {
      test('should have correct message and statusCode', () {
        const failure = ServerFailure(message: 'Server error', statusCode: 404);

        expect(failure.message, 'Server error');
        expect(failure.statusCode, 404);
      });

      test('should be equal with same properties', () {
        const failure1 = ServerFailure(
          message: 'Server error',
          statusCode: 404,
        );
        const failure2 = ServerFailure(
          message: 'Server error',
          statusCode: 404,
        );

        expect(failure1, equals(failure2));
      });
    });

    group('ValidationFailure', () {
      test('should have correct message', () {
        const failure = ValidationFailure(message: 'Validation error');

        expect(failure.message, 'Validation error');
        expect(failure.statusCode, isNull);
      });

      test('should be equal with same properties', () {
        const failure1 = ValidationFailure(message: 'Validation error');
        const failure2 = ValidationFailure(message: 'Validation error');

        expect(failure1, equals(failure2));
      });
    });

    group('NetworkFailure', () {
      test('should have correct message', () {
        const failure = NetworkFailure(message: 'No internet connection');

        expect(failure.message, 'No internet connection');
        expect(failure.statusCode, isNull);
      });
    });

    group('UnknownFailure', () {
      test('should have correct message', () {
        const failure = UnknownFailure(message: 'Unknown error occurred');

        expect(failure.message, 'Unknown error occurred');
        expect(failure.statusCode, isNull);
      });
    });
  });
}
