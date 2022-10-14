import 'package:bike_path_app/core/init/theme/app_theme_interface.dart';
import 'package:bike_path_app/core/init/theme/light/light_theme_interface.dart';
import 'package:flutter/material.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData()
      .copyWith(scaffoldBackgroundColor: colorSchemeLight.scaffoldbgColor);
}
