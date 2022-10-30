import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        primaryColor: colorSchemeLight.blueColor,
        dividerColor: colorSchemeLight.lightBlueColor,
        canvasColor: colorSchemeLight.veryightBlueColor,
        errorColor: colorSchemeLight.orangeColor,
        scaffoldBackgroundColor: colorSchemeLight.scaffoldbgColor,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: colorSchemeLight.blueColor),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorSchemeLight.scaffoldbgColor,
          titleTextStyle: textThemeLight.headline6,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent, statusBarBrightness: Brightness.dark),
        ),
      );
}
