import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:bike_path_app/view/user/report/view_model/report_view_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LikeButton extends StatefulWidget {
  LikeButton({super.key, required this.count, this.id});
  int count = 0;
  final String? id;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  BaseViewModel b = ReportViewModel();
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isLike == false) {
            widget.count++;
            isLike = true;
            addLike();
          } else {
            widget.count--;
            isLike = false;
            addLike();
          }
        });
      },
      child: SizedBox(
        child: Row(
          children: [
            Icon(
              isLike == false ? Icons.favorite_border : Icons.favorite,
              color: isLike == false ? Colors.black26 : Colors.red,
            ),
            SizedBox(
              width: context.width * 0.005,
            ),
            Text(widget.count == 0 ? "" : widget.count.toString()),
          ],
        ),
      ),
    );
  }

  void addLike() {
    b.update(widget.id as String, widget.count);
  }
}
