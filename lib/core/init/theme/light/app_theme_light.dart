import 'package:flutter/material.dart';

import '../app_theme_interface.dart';
import 'light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData().copyWith(
      scaffoldBackgroundColor: colorSchemeLight.scaffoldbgColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorSchemeLight.blueColor));
}
