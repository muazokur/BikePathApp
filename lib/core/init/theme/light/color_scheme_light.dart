import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  Color get scaffoldbgColor => const Color.fromARGB(255, 233, 233, 233);
  Color get blueColor => const Color.fromRGBO(0, 173, 238, 1);
  Color get lightBlueColor => const Color.fromARGB(255, 0, 180, 245);

  Color get veryDarkBlueColor => const Color.fromRGBO(0, 8, 33, 1);
  Color get orangeColor => const Color.fromRGBO(255, 101, 67, 1);
}