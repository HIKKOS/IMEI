import 'package:imei/presentation/views/register.view.dart';
import 'package:imei/utils/preferences.dart';
import 'package:imei/presentation/views/home.view.dart';
import 'package:imei/presentation/views/login.view.dart';

import 'package:flutter/material.dart';

class AppRoutes {
  static String get initialRoute {
    if (Preferences.isUserLogged) {
      return home;
    } else {
      return login;
    }
  }

  static final Map<String, Widget Function(BuildContext)> _routes = {
    home: (_) => const HomeView(),
    login: (_) => const LoginView(),
    signIn: (_) => const RegistroView(),
  };
  static get routes => _routes;
  static String get home => 'home';
  static String get signIn => 'signIn';
  static String get login => 'login';
}
