import 'package:flutter/material.dart';

class NavigationKey {
  /// [navigatorKey] Llave global para navegar entre pantallas.
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  get navigator => navigatorKey.currentState;
}
