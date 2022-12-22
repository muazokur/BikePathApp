import 'dart:io';

import 'package:bike_path_app/core/base/model/base_model.dart';
import 'package:bike_path_app/view/user/model/user_model.dart';
import 'package:dio/dio.dart';

class BaseService {
  static final BaseService _instance = BaseService._init();
  BaseService._init();
  static BaseService get instance => _instance;

  Future get<T extends BaseModel>(String url, T model) async {
    try {
      var response = await Dio().get(url);
      switch (response.statusCode) {
        case HttpStatus.ok:
          var jsonModel = response.data;
          if (jsonModel is Map) {
            print(jsonModel.values.first);
            if (jsonModel.length > 1) {
              List<T> list = [];
              if (jsonModel.values.first.runtimeType == String) {
                print("1");
                var userModel = model.fromJson(jsonModel as Map<String, dynamic>);
                return userModel;
              } else {
                print(jsonModel.values.first.runtimeType);
                print("2");
                jsonModel.forEach((key, value) {
                  list.add(model.fromJson(value));
                });
                return list;
              }
            }
            return jsonModel;
          } else if (jsonModel is List) {
            return jsonModel.map((value) {
              return model.fromJson(value);
            }).toList();
          }
          return jsonModel;
        case HttpStatus.forbidden:
          print("404 not found");
          break;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> post(String url, String id, String email, String name, String surname) async {
    try {
      var jsonModel = UserModel(name: name, surname: surname, id: id, email: email).toJson();
      Map<String, Map<String, dynamic>> data = {
        id: jsonModel,
      };
      print(jsonModel);
      await Dio().patch(
        url,
        data: data,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
