import 'dart:io';

import 'package:bike_path_app/core/base/model/base_model.dart';
import 'package:bike_path_app/view/user/create_report/model/report_model.dart';
import 'package:bike_path_app/view/user/model/user_model.dart';
import 'package:dio/dio.dart';

import '../generate/generate_key.dart';

class BaseService {
  static final BaseService _instance = BaseService._init();
  BaseService._init();
  static BaseService get instance => _instance;

  List<dynamic> reportKeysList = [];

  Future get<T extends BaseModel>(String url, T model) async {
    try {
      var response = await Dio().get(url);
      switch (response.statusCode) {
        case HttpStatus.ok:
          var jsonModel = response.data;
          if (jsonModel is Map) {
            // if (jsonModel.length > 1) {
            //listede tek eleman olma durumu
            List<T> list = [];
            if (jsonModel.values.first.runtimeType == String) {
              var userModel = model.fromJson(jsonModel as Map<String, dynamic>);
              return userModel;
            } else {
              jsonModel.forEach((key, value) {
                list.add(model.fromJson(value));
              });
              return list;
            }
            // }
            //  return jsonModel;
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

  Future<bool> postReport(String id, String url, String photo, String title, String description,
      List<double> location, String date, String address, bool state) async {
    String key = GenerateKey.instance.createKey();

    try {
      var jsonModel = ReportModel(
              comments: "",
              key: key,
              id: id,
              state: state,
              address: address,
              date: date,
              description: description,
              location: location,
              photo: photo,
              title: title)
          .toJson();
      Map<String, Map<String, dynamic>> data = {
        key: jsonModel,
      };
      print(data);
      await Dio().patch(
        url,
        data: data,
      );
      print(data);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> update(String url, String key, dynamic value) async {
    try {
      Map<String, dynamic> data = {
        key: value,
      };
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

  Future<bool> addComment(String url, String key, dynamic value) async {
    try {
      var jsonModel = CommentId(id: key, comment: value).toJson();
      Map<String, dynamic> data = {
        key: jsonModel,
      };
      print(data);

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
