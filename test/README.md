# Products Task - Test Suite Documentation

## Overview

This project includes comprehensive test coverage including:

- **Unit Tests**: Testing individual components in isolation
- **Widget Tests**: Testing UI components
- **Integration Tests**: Testing complete user flows

## Test Structure

```
test/
├── core/
│   ├── common/
│   │   └── widgets/
│   │       └── app_loader_test.dart
│   ├── errors/
│   │   └── failures_test.dart
│   └── helpers/
│       └── bloc_status_test.dart
├── features/
│   └── products/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── local_product_datasource_test.dart
│       │   ├── models/
│       │   │   └── product_model_test.dart
│       │   └── repositories/
│       │       └── product_repository_impl_test.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── product_test.dart
│       │   └── usecases/
│       │       ├── add_product_usecase_test.dart
│       │       ├── delete_product_usecase_test.dart
│       │       └── get_products_usecase_test.dart
│       └── presentation/
│           ├── cubit/
│           │   └── product_cubit_test.dart
│           └── widgets/
│               └── product_card_test.dart
└── helpers/
    └── test_helpers.dart

integration_test/
└── app_test.dart
```

## Running Tests

### Run All Tests

```bash
flutter test
```

### Run Specific Test File

```bash
flutter test test/features/products/domain/entities/product_test.dart
```

### Run Tests with Coverage

```bash
flutter test --coverage
```

### View Coverage Report (after generating coverage)

```bash
# Install lcov if not already installed
# On Ubuntu/Debian: sudo apt-get install lcov
# On macOS: brew install lcov

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open in browser
open coverage/html/index.html
```

### Run Integration Tests

```bash
flutter test integration_test/app_test.dart
```

## Test Categories

### 1. Unit Tests

#### Domain Layer Tests

- **Product Entity Tests** (`product_test.dart`)
    - Equality comparison
    - copyWith functionality
    - Property preservation

- **Use Case Tests**
    - `get_products_usecase_test.dart`: Tests fetching products
    - `add_product_usecase_test.dart`: Tests adding products
    - `delete_product_usecase_test.dart`: Tests deleting products

#### Data Layer Tests

- **Product Model Tests** (`product_model_test.dart`)
    - JSON serialization/deserialization
    - Entity conversion
    - Data integrity

- **Data Source Tests** (`local_product_datasource_test.dart`)
    - CRUD operations
    - Data persistence
    - Error handling

- **Repository Tests** (`product_repository_impl_test.dart`)
    - Repository pattern implementation
    - Failure handling
    - Data transformation

#### Presentation Layer Tests

- **Cubit Tests** (`product_cubit_test.dart`)
    - State management
    - Business logic
    - User interactions
    - Category filtering

#### Core Tests

- **Failures Tests** (`failures_test.dart`)
    - Different failure types
    - Equality comparison

- **BlocStatus Tests** (`bloc_status_test.dart`)
    - State status management
    - Status checking methods
    - Data preservation

### 2. Widget Tests

- **Product Card Tests** (`product_card_test.dart`)
    - UI rendering
    - Data display
    - User interactions

- **App Loader Tests** (`app_loader_test.dart`)
    - Loading indicator display

### 3. Integration Tests

- **App Tests** (`app_test.dart`)
    - Complete user flows
    - Navigation testing
    - Feature integration
    - Category filtering
    - Product management

## Testing Best Practices Used

1. **AAA Pattern**: Arrange, Act, Assert
2. **Test Isolation**: Each test is independent
3. **Mocking**: Using Mocktail for clean mocks
4. **Descriptive Names**: Clear test descriptions
5. **Group Organization**: Related tests are grouped
6. **Edge Cases**: Testing boundary conditions
7. **Error Scenarios**: Testing failure paths

## Mocking Strategy

We use **Mocktail** for mocking dependencies:

- Clean syntax
- Type-safe mocks
- Easy verification

Example:

```dart
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository mockRepository;
  
  setUp(() {
    mockRepository = MockProductRepository();
  });
  
  test('should return products', () async {
    when(() => mockRepository.getProducts())
        .thenAnswer((_) async => Right(products));
    
    // Test implementation
  });
}
```

## Coverage Goals

- **Unit Tests**: >90% coverage
- **Widget Tests**: >80% coverage
- **Integration Tests**: Critical user flows covered

## CI/CD Integration

These tests can be integrated into CI/CD pipelines:

```yaml
# Example GitHub Actions
- name: Run Tests
  run: flutter test --coverage

- name: Upload Coverage
  uses: codecov/codecov-action@v3
  with:
    files: ./coverage/lcov.info
```

## Troubleshooting

### Common Issues

1. **Test Timeout**
    - Increase timeout: `testWidgets('test', (tester) async { ... }, timeout: Timeout(Duration(seconds: 60)))`

2. **Asset Loading Errors**
    - Ensure assets are properly configured in `pubspec.yaml`
    - Use `DefaultAssetBundle.of(context).loadString()` for JSON

3. **Mock Not Working**
    - Register fallback values: `registerFallbackValue(YourType())`

4. **Integration Test Fails**
    - Ensure app builds successfully first
    - Check if service locator is properly initialized

## Contributing

When adding new features:

1. Write tests first (TDD)
2. Ensure tests pass
3. Maintain coverage levels
4. Update this documentation

## Additional Resources

- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Mocktail Package](https://pub.dev/packages/mocktail)
- [Integration Testing](https://docs.flutter.dev/testing/integration-tests)

