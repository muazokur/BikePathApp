// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bike_path_app/core/extensions/context_extension.dart';

class GeneralElevatedButton extends StatelessWidget {
  const GeneralElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => context.theme.primaryColor),
          padding: MaterialStateProperty.resolveWith((states) => context.paddingNormal),
          shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Center(
        child: Text(
          text,
          style: context.textThemeLight.headline5,
        ),
      ),
    );
  }
}
