import 'package:flutter_test/flutter_test.dart';
import 'package:products_task/core/common/enums/state_status.dart';
import 'package:products_task/core/helpers/bloc_status.dart';

void main() {
  group('BlocStatus', () {
    group('Constructor Tests', () {
      test('initial should create status with initial state', () {
        const status = BlocStatus<String>.initial();

        expect(status.status, StateStatus.initial);
        expect(status.error, isNull);
        expect(status.data, isNull);
      });

      test('initial should create status with initial data', () {
        const status = BlocStatus<String>.initial(data: 'test');

        expect(status.status, StateStatus.initial);
        expect(status.data, 'test');
      });

      test('loading should create status with loading state', () {
        const status = BlocStatus<String>.loading();

        expect(status.status, StateStatus.loading);
        expect(status.error, isNull);
        expect(status.data, isNull);
      });

      test('loading should preserve data', () {
        const status = BlocStatus<String>.loading(data: 'preserved');

        expect(status.status, StateStatus.loading);
        expect(status.data, 'preserved');
      });

      test('success should create status with success state', () {
        const status = BlocStatus<String>.success(data: 'success data');

        expect(status.status, StateStatus.success);
        expect(status.data, 'success data');
        expect(status.error, isNull);
      });

      test('empty should create status with empty state', () {
        const status = BlocStatus<String>.empty();

        expect(status.status, StateStatus.empty);
        expect(status.error, isNull);
        expect(status.data, isNull);
      });

      test('fail should create status with failure state and error', () {
        const status = BlocStatus<String>.fail(error: 'test error');

        expect(status.status, StateStatus.failure);
        expect(status.error, 'test error');
        expect(status.data, isNull);
      });

      test('fail should preserve data with error', () {
        const status = BlocStatus<String>.fail(
          error: 'test error',
          data: 'preserved data',
        );

        expect(status.status, StateStatus.failure);
        expect(status.error, 'test error');
        expect(status.data, 'preserved data');
      });
    });

    group('State Check Methods', () {
      test('isInitial should return true for initial state', () {
        const status = BlocStatus<String>.initial();

        expect(status.isInitial(), true);
        expect(status.isLoading(), false);
        expect(status.isSuccess(), false);
        expect(status.isEmpty(), false);
        expect(status.isFailed(), false);
      });

      test('isLoading should return true for loading state', () {
        const status = BlocStatus<String>.loading();

        expect(status.isLoading(), true);
        expect(status.isInitial(), false);
        expect(status.isSuccess(), false);
        expect(status.isEmpty(), false);
        expect(status.isFailed(), false);
      });

      test('isSuccess should return true for success state', () {
        const status = BlocStatus<String>.success(data: 'data');

        expect(status.isSuccess(), true);
        expect(status.isInitial(), false);
        expect(status.isLoading(), false);
        expect(status.isEmpty(), false);
        expect(status.isFailed(), false);
      });

      test('isEmpty should return true for empty state', () {
        const status = BlocStatus<String>.empty();

        expect(status.isEmpty(), true);
        expect(status.isInitial(), false);
        expect(status.isLoading(), false);
        expect(status.isSuccess(), false);
        expect(status.isFailed(), false);
      });

      test('isFailed should return true for failure state', () {
        const status = BlocStatus<String>.fail(error: 'error');

        expect(status.isFailed(), true);
        expect(status.isInitial(), false);
        expect(status.isLoading(), false);
        expect(status.isSuccess(), false);
        expect(status.isEmpty(), false);
      });
    });

    group('Equality Tests', () {
      test('should be equal with same status and data', () {
        const status1 = BlocStatus<String>.success(data: 'test');
        const status2 = BlocStatus<String>.success(data: 'test');

        expect(status1, equals(status2));
      });

      test('should not be equal with different status', () {
        const status1 = BlocStatus<String>.success(data: 'test');
        const status2 = BlocStatus<String>.loading(data: 'test');

        expect(status1, isNot(equals(status2)));
      });

      test('should not be equal with different data', () {
        const status1 = BlocStatus<String>.success(data: 'test1');
        const status2 = BlocStatus<String>.success(data: 'test2');

        expect(status1, isNot(equals(status2)));
      });

      test('should not be equal with different errors', () {
        const status1 = BlocStatus<String>.fail(error: 'error1');
        const status2 = BlocStatus<String>.fail(error: 'error2');

        expect(status1, isNot(equals(status2)));
      });
    });

    group('Complex Types', () {
      test('should work with List<int>', () {
        const status = BlocStatus<List<int>>.success(data: [1, 2, 3]);

        expect(status.data, [1, 2, 3]);
        expect(status.isSuccess(), true);
      });

      test('should work with Map<String, dynamic>', () {
        const testMap = {'key': 'value', 'number': 42};
        const status = BlocStatus<Map<String, dynamic>>.success(data: testMap);

        expect(status.data, testMap);
        expect(status.isSuccess(), true);
      });

      test('should work with nullable types', () {
        const status = BlocStatus<String?>.success(data: null);

        expect(status.data, isNull);
        expect(status.isSuccess(), true);
      });
    });
  });
}
