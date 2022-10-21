// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      decoration: BoxDecoration(
        color: context.theme.dividerColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
