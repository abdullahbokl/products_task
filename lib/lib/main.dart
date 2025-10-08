import 'package:flutter/material.dart';

import 'core/di/service_locator.dart';
import 'core/utils/themes.dart';
import 'features/product_list/presentation/pages/product_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Design App',
      theme: AppThemes.lightTheme,
      home: const ProductListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
