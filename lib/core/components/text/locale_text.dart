// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:bike_path_app/core/extensions/string_extension.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.locale,
      style: style,
      textAlign: textAlign,
    );
  }
}
