import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(color: Colors.green),
  colorScheme: const ColorScheme.light(
    primary: Colors.green,
    onPrimary: Colors.white,
    secondary: Colors.green,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(color: Colors.green),
  colorScheme: const ColorScheme.dark(
    primary: Colors.green,
    onPrimary: Colors.white,
    secondary: Colors.green,
  ),
);