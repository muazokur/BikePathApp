import 'dart:io';

import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

// ignore: must_be_immutable
class CircularAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CircularAppBar({
    Key? key,
    this.title = const Text("Bike Path App"),
    this.onTap,
  }) : super(key: key);
  final Widget? title;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: InkWell(
        child: Center(child: title),
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
      ),
      leading: IconButton(
        iconSize: 16,
        icon: const Icon(Icons.exit_to_app),
        onPressed: () {
          exit(0);
        },
      ),
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
