import 'package:easy_localization/easy_localization.dart';

extension StringLocalization on String {
  String get locale => this.tr();
}

extension PNGPATH on String {
  String get toPNG => "assets/png/$this.png";
}
