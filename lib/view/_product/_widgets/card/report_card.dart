import 'package:flutter/material.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    Key? key,
    this.title,
    this.subtitle,
    this.tralling,
    this.leadingCircleAvatar,
    required this.onLongPress,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? tralling;
  final String? leadingCircleAvatar;
  final void Function() onLongPress;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        minLeadingWidth: context.width * 0.1,
        contentPadding: context.paddingMedium * 0.50,
        leading: Container(
          color: Colors.green,
          child: Image.asset(
            leadingCircleAvatar ?? "none",
            fit: BoxFit.contain,
          ),
        ),
        title: Text(title ?? ""),
        subtitle: Text(subtitle ?? ""),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              tralling ?? "",
              style: context.textThemeLight.headline7,
            ),
            const Text("Düzeltildi"),
          ],
        ),
        onLongPress: () {
          onLongPress();
        },
      ),
    );
  }
}
