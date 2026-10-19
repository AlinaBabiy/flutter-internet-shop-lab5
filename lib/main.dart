import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/providers/product_provider.dart';
import 'presentation/di/app_dependencies.dart';
import 'screens/home_screen.dart';
import 'providers/cart_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CartNotifier>(
          create: (BuildContext context) => CartNotifier(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (BuildContext context) =>
              AppDependencies.createInitializedProductProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Інтернет-магазин',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
