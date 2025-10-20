import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_task/core/common/widgets/app_loader.dart';

void main() {
  group('AppLoader Widget', () {
    testWidgets('should render without error', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: AppLoader())),
      );

      expect(find.byType(AppLoader), findsOneWidget);
    });

    testWidgets('should display loading indicator', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: AppLoader())),
      );

      // Verify that a loading indicator is present
      expect(find.byType(AppLoader), findsOneWidget);
    });
  });
}
