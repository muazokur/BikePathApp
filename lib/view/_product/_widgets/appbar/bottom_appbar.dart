import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ProductBottomAppBar extends StatefulWidget {
  const ProductBottomAppBar({
    Key? key,
  }) : super(key: key);

  //final VoidCallback onTap

  @override
  State<ProductBottomAppBar> createState() => _ProductBottomAppBarState();
}

class _ProductBottomAppBarState extends State<ProductBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      color: context.theme.dividerColor,
      child: TabBar(
        padding: context.paddingLowVertical,
        labelStyle: context.textTheme.headline5,
        indicatorColor: Colors.transparent,
        tabs: [
          tabBarItem(const Icon(Icons.notification_important_outlined), "Bildiri", context),
          tabBarItem(const Icon(Icons.account_circle_outlined), "Profil", context),
        ],
      ),
    );
  }
}

Widget tabBarItem(Icon icon, String text, BuildContext context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: context.paddingLowHorizontal,
        child: icon,
      ),
      Text(text),
    ],
  );
}
