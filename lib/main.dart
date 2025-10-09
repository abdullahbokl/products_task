import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';

import 'core/services/service_locator/service_locator.dart';
import 'products_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProductsApp(),
    ),
  );
}

Future<void> _initApp() async {
  await configureDependencies();
}
