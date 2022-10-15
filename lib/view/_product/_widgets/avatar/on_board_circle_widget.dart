// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/theme/light/color_scheme_light.dart';

class OnBoardCircle extends StatelessWidget {
  const OnBoardCircle({
    Key? key,
    required this.isSelected,
  }) : super(key: key);
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        backgroundColor: ColorSchemeLight.instance!.orangeColor
            .withOpacity(isSelected ? 1 : 0.2),
        radius: isSelected ? context.width * 0.020 : context.width * 0.010,
      ),
    );
  }
}
