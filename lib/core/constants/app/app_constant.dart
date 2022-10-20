import 'package:flutter/material.dart';

class ApplicationConstant {
  // ignore: constant_identifier_names
  static const TR_LOCALE = Locale("tr", "TR");
  // ignore: constant_identifier_names
  static const EN_LOCALE = Locale("en", "US");
  // ignore: constant_identifier_names
  static const LANG_PATH = "assets/lang";
  // ignore: constant_identifier_names
  static const SUPPORTED_LOCALE = [EN_LOCALE, TR_LOCALE];

  // ignore: constant_identifier_names
  static const EMAIL_REGIEX =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
}
