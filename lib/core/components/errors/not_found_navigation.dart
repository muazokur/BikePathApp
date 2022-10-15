import 'package:flutter/material.dart';

class NotFoundNavigation extends StatelessWidget {
  const NotFoundNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sayfa Bulunamadi"),
      ),
      body: const Center(child: Text("Not Found")),
    );
  }
}
