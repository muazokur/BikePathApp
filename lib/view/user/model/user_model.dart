import 'package:bike_path_app/core/base/model/base_model.dart';

class UserModel extends BaseModel {
  late String name;
  late int point;
  late int sumNotification;
  late String surname;
  late String photoUrl;
  late String id;
  late String email;
  UserModel(
      {required this.name,
      this.point = 0,
      this.sumNotification = 0,
      required this.surname,
      this.photoUrl = "",
      required this.id,
      required this.email});

  UserModel.empty();

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    point = json['point'];
    sumNotification = json['sumNotification'];
    surname = json['surname'];
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['point'] = point;
    data['sumNotification'] = sumNotification;
    data['surname'] = surname;
    data['photoUrl'] = photoUrl;
    data['id'] = id;
    data['email'] = email;
    return data;
  }
}

class UserModelCache {
  static late String userName;
  static late String surName;
  static late String photoUrl;
}
