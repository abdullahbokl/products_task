import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:device_preview/device_preview.dart';
import 'core/services/service_locator/service_locator.dart'
    show configureDependencies, getIt;
import 'core/services/navigation/navigation_service.dart';
import 'core/utils/themes.dart';
import 'core/utils/responsive.dart';
import 'core/localization/app_localization_delegate.dart';
import 'features/products/presentation/pages/product_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
      availableLocales: [
        const Locale('ar', 'SA'),
        const Locale('en', 'US'),
      ],
    ),
  );
}

Future<void> _initApp() async {
  await configureDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products Task',
      theme: AppThemes.staticLightTheme,
      // DevicePreview configuration
      builder: (context, child) {
        // Initialize responsive system here with context
        Responsive.init(context);
        // Wrap with DevicePreview builder
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
