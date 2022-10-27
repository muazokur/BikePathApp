// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:bike_path_app/view/_product/_constants/image_path_png.dart';
import 'package:flutter/material.dart';

class UserAlertDialog {
  final BuildContext context;
  UserAlertDialog({
    required this.context,
  });

  PersistentBottomSheetController show() {
    return showBottomSheet(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: context.paddingLow,
            child: Container(
              color: context.theme.scaffoldBackgroundColor,
              height: context.height * 0.80,
              width: context.width,
              child: Column(
                children: [
                  Container(
                    height: context.height * 0.30,
                    color: Colors.amberAccent,
                    child: Image.asset(
                      PNGImagePaths.instance.mePNG,
                    ),
                  ),
                  Text(
                    "Başlık",
                    style: context.textThemeLight.headline4,
                  ),
                  AutoSizeText(
                    "Açıklama " * 18,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w300, height: 2),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
