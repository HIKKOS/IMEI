import 'package:imei/utils/navigation_key.dart';
import 'package:flutter/widgets.dart';

class Navigation {
  static GlobalKey<NavigatorState> navigatorKey = NavigationKey.navigatorKey;

  static Future<dynamic> pushNamed(
      {required String routeName, Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushRoute(Route route) {
    return navigatorKey.currentState!.push(route);
  }

  static Future<dynamic> pushNamedAndRemoveUntil({
    required String routeName,
    RoutePredicate? predicate,
    Object? arguments,
  }) {
    return navigatorKey.currentState != null
        ? navigatorKey.currentState!.pushNamedAndRemoveUntil(
            routeName, predicate ?? (route) => false,
            arguments: arguments)
        : Future.value();
  }

  static Future<dynamic> pushRouteAndRemoveUntil({
    required Route route,
    RoutePredicate? predicate,
    Object? arguments,
  }) {
    return navigatorKey.currentState != null
        ? navigatorKey.currentState!.pushAndRemoveUntil(
            route,
            predicate ?? (route) => false,
          )
        : Future.value();
  }

  static Future<dynamic> pushReplacementNamed(
      {required String routeName, Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static void pop([bool result = false]) {
    return navigatorKey.currentState!.pop(result);
  }

  static void popUntil(bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState!.popUntil(predicate);
  }

  static bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  static void popIfCan() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
  }

  static void popTwice() {
    navigatorKey.currentState!.pop();
    return navigatorKey.currentState!.pop();
  }

  static void unFocus() {
    FocusScope.of(navigatorKey.currentState!.context).unfocus();
  }
}
