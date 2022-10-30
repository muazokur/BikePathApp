// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(path);
  }
}
