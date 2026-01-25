import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalFunction {
  static void changeStatusBarTheme({required isDark}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void showCustomSnackbar({
    required String message,
    required bool isSuccess,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      dismissDirection: DismissDirection.startToEnd,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      content: Text(message),
    );
    ScaffoldMessenger.of(
      navigatorKey.currentState!.context,
    ).showSnackBar(snackBar);
  }
}
