import 'package:flutter/material.dart';
import 'package:imei/config/routes/app_routes.dart';
import 'package:imei/config/themes/themes.dart';
import 'package:imei/presentation/views/login.view.dart';
import 'package:imei/utils/navigation_key.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.login,
      theme: AppTheme.lightTheme,
      navigatorKey: NavigationKey.navigatorKey,
      home: const LoginView(),
    );
  }
}
