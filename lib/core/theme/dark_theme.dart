import 'package:flutter/material.dart';

import '../extension/custom_dark_theme.dart';

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF0A0E21),
    ),
    scaffoldBackgroundColor: Color(0xFF0A0E21),
    cardTheme: const CardTheme(
      color: Colors.grey,
    ),
    extensions: [
      darkThemeExtension,
    ],
  );
}
