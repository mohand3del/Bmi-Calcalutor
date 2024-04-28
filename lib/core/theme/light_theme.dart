import 'package:bim_calculator/core/extension/custom_light_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.lightBlueAccent,
      
    ),
    scaffoldBackgroundColor: Colors.white,
    cardTheme: const CardTheme(
      color: Colors.grey,
    ),
    extensions: [
      lightThemeExtension,
    ],
  );
}
