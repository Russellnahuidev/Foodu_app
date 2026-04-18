import 'package:flutter/material.dart';
import 'package:foodu_app/app/routes/app_router.dart';
import 'package:foodu_app/app/themes/app_theme.dart';

class FooduApp extends StatelessWidget {
  const FooduApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Foodu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
