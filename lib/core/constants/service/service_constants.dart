import 'package:bike_path_app/core/extensions/string_extension.dart';

class ServiceConstants {
  static const _api_url = "https://mmo-bike-path-default-rtdb.europe-west1.firebasedatabase.app/";

  static final firebaseUrl = _api_url.json;

  static final users = "$_api_url/users".json;
}
