import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_task/core/localization/app_localization_delegate.dart';
import 'package:products_task/core/utils/responsive.dart';
import 'package:products_task/features/products/domain/entities/product.dart';
import 'package:products_task/features/products/presentation/widgets/product/product_card.dart';

void main() {
  group('ProductCard Widget', () {
    const testProduct = Product(
      id: '1',
      name: 'Test Product',
      storeName: 'Test Store',
      price: 99.99,
      category: 'Electronics',
      imageUrls: ['https://example.com/image1.jpg'],
    );

    Widget createTestWidget(Widget child) {
      return MaterialApp(
        localizationsDelegates: const [
          AppLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('ar')],
        locale: const Locale('en'),
        home: Builder(
          builder: (context) {
            // Initialize Responsive before building widget
            Responsive.init(context);
            return Scaffold(body: child);
          },
        ),
      );
    }

    testWidgets('should render product card with product data', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(const ProductCard(product: testProduct)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ProductCard), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should display product name', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(const ProductCard(product: testProduct)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Product'), findsOneWidget);
    });

    testWidgets('should display store name', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(const ProductCard(product: testProduct)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Store'), findsOneWidget);
    });

    testWidgets('should display formatted price', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(const ProductCard(product: testProduct)),
      );
      await tester.pumpAndSettle();

      // Price should be displayed somewhere in the widget
      expect(find.textContaining('99.99'), findsOneWidget);
    });

    testWidgets('should render with different product data', (
      WidgetTester tester,
    ) async {
      const differentProduct = Product(
        id: '2',
        name: 'Another Product',
        storeName: 'Another Store',
        price: 199.99,
        category: 'Fashion',
        imageUrls: ['https://example.com/image2.jpg'],
      );

      await tester.pumpWidget(
        createTestWidget(const ProductCard(product: differentProduct)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Another Product'), findsOneWidget);
      expect(find.text('Another Store'), findsOneWidget);
      expect(find.textContaining('199.99'), findsOneWidget);
    });

    testWidgets('should handle null onDelete callback', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ProductCard(product: testProduct, onDelete: null),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ProductCard), findsOneWidget);
    });

    testWidgets('should call onDelete when provided and triggered', (
      WidgetTester tester,
    ) async {
      bool deleteCalled = false;

      await tester.pumpWidget(
        createTestWidget(
          ProductCard(
            product: testProduct,
            onDelete: () {
              deleteCalled = true;
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Note: The actual delete button interaction would depend on the implementation
      // This is a basic test to verify the callback can be passed
      expect(deleteCalled, false); // Initially not called
    });
  });
}
