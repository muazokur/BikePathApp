import 'package:bike_path_app/view/_product/_widgets/button/comment_button.dart';
import 'package:bike_path_app/view/_product/_widgets/button/like_button.dart';
import 'package:flutter/material.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    Key? key,
    this.title,
    this.subtitle,
    this.tralling,
    this.leadingCircleAvatar,
    required this.onTap,
    this.likeCount,
    this.commentCount,
    this.id,
    this.state,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? tralling;
  final String? leadingCircleAvatar;
  final int? likeCount;
  final int? commentCount;
  final String? id;
  final bool? state;

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingMedium * 0.50,
        child: Column(
          children: [
            ListTile(
              minLeadingWidth: context.width * 0.1,
              contentPadding: context.paddingMedium * 0,
              leading: Container(
                color: Colors.transparent,
                child: Image.network(
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
                  state != null
                      ? state == false
                          ? Text("Düzeltilmedi")
                          : Text("Düzeltildi")
                      : Text("")
                ],
              ),
              onTap: () {
                onTap();
              },
            ),
            Divider(
              color: Colors.black26,
            ),
            Row(
              children: [
                LikeButton(count: likeCount!, id: id),
                SizedBox(
                  width: context.width * 0.020,
                ),
                CommentButton(onTap: onTap),
              ],
            )
          ],
        ),
      ),
    );
  }
}
