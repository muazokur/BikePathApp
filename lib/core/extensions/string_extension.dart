import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constant.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  bool? get isValidEmail => contains(RegExp(ApplicationConstant.EMAIL_REGIEX));
}

extension PNGPATH on String {
  String get toPNG => "assets/png/$this.png";
}

extension LOTTIEPATH on String {
  String get toJSON => "assets/lottie/$this.json";
}

extension JsonExtension on String {
  String get json => "$this.json";
}
