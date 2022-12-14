import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight? get instance {
    _instace ??= TextThemeLight._init();
    return _instace;
  }

  TextThemeLight._init();

  final TextStyle headline1 =
      const TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline2 =
      const TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 = const TextStyle(fontSize: 48, fontWeight: FontWeight.w400);
  final TextStyle headline4 = const TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Color.fromRGBO(39, 105, 171, 1));
  final TextStyle headline5 =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);
  final TextStyle headline6 = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w700, color: Color.fromRGBO(39, 105, 171, 1));
  final TextStyle headline7 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Color.fromRGBO(39, 105, 171, 1));
  final TextStyle overline =
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}
