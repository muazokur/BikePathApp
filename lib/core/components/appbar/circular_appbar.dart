import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class CircularAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CircularAppBar({
    Key? key,
    this.title,
  }) : super(key: key);
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: title),
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
          gradient: LinearGradient(
            colors: [
              context.theme.primaryColor,
              context.theme.dividerColor,
              context.theme.canvasColor
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
