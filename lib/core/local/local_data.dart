import 'package:bim_calculator/core/constants/keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static late final SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static ThemeMode getThemeMode() {
    String themeMode = _pref.getString(Keys.themeMode) ?? Keys.lightMode;
    return themeMode == Keys.lightMode ? ThemeMode.light : ThemeMode.dark;
  }

  static Future<void> setThemeMode(ThemeMode mode) async {
    String themeModeString =
        mode == ThemeMode.light ? Keys.lightMode : Keys.darkMode;
    await _pref.setString(Keys.themeMode, themeModeString);
  }

  static Future<void> switchThemeMode() async {
    ThemeMode themeMode = getThemeMode();
    ThemeMode newThemeMode =
        themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setThemeMode(newThemeMode);
  }
}