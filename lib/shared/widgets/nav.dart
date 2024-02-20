import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Nav {
  static final navigator = GlobalKey<NavigatorState>();

  static final BuildContext? _context = navigator.currentState?.context;

  static void removeAllFocus() => FocusScope.of(_context!).unfocus();

  static Future<T?> to<T>(Widget page) async {
    removeAllFocus();
    return await Navigator.push<T>(_context!, MaterialPageRoute<T>(builder: (context) => page));
  }

  static Future<Future<T?>> offAll<T>(Widget page) async {
    removeAllFocus();
    return Navigator.pushAndRemoveUntil<T>(_context!, MaterialPageRoute<T>(builder: (context) => page), (route) => false);
  }

  static Future<Future<T?>> toRoute<T>(Route<T> route) async {
    removeAllFocus();
    return Navigator.push<T>(_context!, route);
  }

  static Future<Future<R?>> replace<R, T>(Widget page, {T? result}) async {
    removeAllFocus();
    return Navigator.pushReplacement<R, T>(_context!, MaterialPageRoute<R>(builder: (context) => page), result: result);
  }

  static Future<void> back<T>({T? result}) async {
    removeAllFocus();
    return Navigator.pop<T>(_context!, result);
  }

  static Future<void> sysPop<T>() async => SystemNavigator.pop();

  static void popUntil(RoutePredicate predicate) {
    removeAllFocus();
    return Navigator.popUntil(_context!, predicate);
  }
}
