import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ProductBottomAppBar extends StatelessWidget {
  const ProductBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          color: context.theme.canvasColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTabItem(
                  index: 0,
                  icon: Icons.notification_important_outlined,
                  label: const Text("Bildiri")),
              buildTabItem(
                  index: 1, icon: Icons.account_circle_outlined, label: const Text("Profil")),
            ],
          )),
    );
  }
}

Widget buildTabItem({required index, required icon, required label}) {
  return TextButton.icon(onPressed: () {}, icon: Icon(icon), label: label);
}
