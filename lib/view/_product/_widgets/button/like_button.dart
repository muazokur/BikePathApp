import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  int count = 0;
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isLike == false) {
            count++;
            isLike = true;
          } else {
            count--;
            isLike = false;
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
            Text(count == 0 ? "" : count.toString()),
          ],
        ),
      ),
    );
  }
}
