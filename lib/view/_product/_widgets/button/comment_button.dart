import 'dart:math';

import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    Random rnd = Random();

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          children: [
            Icon(
              Icons.insert_comment_outlined,
              color: Colors.black38,
            ),
            SizedBox(
              width: context.width * 0.005,
            ),
            Text(rnd.nextInt(100).toString())
          ],
        ),
      ),
    );
  }
}
