import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  Color get scaffoldbgColor => const Color.fromARGB(255, 233, 233, 233);
  // Color get blueColor => const Color.fromRGBO(0, 173, 238, 1);
  // Color get lightBlueColor => const Color.fromRGBO(255, 0, 180, 245);

  Color get blueColor => const Color.fromARGB(255, 13, 183, 245);
  Color get lightBlueColor => const Color.fromARGB(255, 99, 186, 218);
  Color get veryightBlueColor => const Color.fromARGB(255, 156, 215, 236);

  Color get veryDarkBlueColor => const Color.fromRGBO(0, 8, 33, 1);
  Color get orangeColor => const Color.fromRGBO(255, 101, 67, 1);

  Color get primaryPurple => Color.fromARGB(255, 198, 99, 231);
  Color get secondaryPurple => Color.fromARGB(255, 207, 129, 212);
}
