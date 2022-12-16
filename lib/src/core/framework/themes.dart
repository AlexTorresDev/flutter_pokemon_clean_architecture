import 'package:flutter/material.dart';

class AppTheme {
  static final defaultLightColorScheme = ColorScheme.light(
    primary: Colors.teal,
    primaryContainer: Colors.teal.shade700,
    secondary: Colors.teal.shade200,
    secondaryContainer: Colors.teal.shade100,
    background: Colors.white,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
  );

  static final defaultDarkColorScheme = ColorScheme.dark(
    primary: Colors.teal,
    primaryContainer: Colors.teal.shade700,
    secondary: Colors.teal.shade200,
    secondaryContainer: Colors.teal.shade100,
    background: Colors.black,
    surface: Colors.black,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.white,
    onSurface: Colors.white,
    error: Colors.red,
    onError: Colors.white,
  );
}
