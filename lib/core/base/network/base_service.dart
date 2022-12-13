import 'dart:io';

import 'package:dio/dio.dart';

class BaseService {
  static final BaseService _instance = BaseService._init();
  BaseService._init();
  static BaseService get instance => _instance;

  void get(String url) async {
    try {
      var response = await Dio().get(url);

      switch (response.statusCode) {
        case HttpStatus.ok:
          var table = response.data;
          print(table);
          print(table.runtimeType);
          if (table is Map) {
          } else if (table is List) {}
          break;
        case HttpStatus.forbidden:
          print("404 not found");
          break;
      }
    } catch (e) {
      print(e);
    }
  }
}
