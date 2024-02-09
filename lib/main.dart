import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/config/router/app_router.dart';
import 'package:shoes_app/config/theme/app_theme.dart';
import 'package:shoes_app/presentation/providers/shoe_provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ShoeProvider())],
    child: const MyApp()
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}