import 'package:device_preview/device_preview.dart' show DevicePreview;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/localization/app_localization_delegate.dart';
import 'core/services/navigation/navigation_service.dart';
import 'core/services/service_locator/service_locator.dart';
import 'core/utils/responsive.dart';
import 'core/utils/themes.dart';
import 'features/products/presentation/pages/product_list_screen.dart';

class ProductsApp extends StatelessWidget {
  const ProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products Task',
      theme: AppThemes.staticLightTheme,
      builder: (context, child) {
        Responsive.init(context);
        child = DevicePreview.appBuilder(context, child);
        return child;
      },
      home: const ProductListScreen(),
      debugShowCheckedModeBanner: false,
      navigatorKey: getIt<NavigationService>().navigatorKey,
      locale: const Locale('ar', 'SA'),
      supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
