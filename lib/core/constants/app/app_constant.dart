import 'package:flutter/material.dart';

class ApplicationConstant {
  static const TR_LOCALE = Locale("tr", "TR");
  static const EN_LOCALE = Locale("en", "US");
  static const SUPPORTED_LOCALE = [EN_LOCALE, TR_LOCALE];
  static const LANG_PATH = "assets/lang";
  static const LOTTIE_PATH = "assets/lottie";
  static const EMAIL_REGIEX =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
}
