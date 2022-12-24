import 'package:bike_path_app/core/extensions/string_extension.dart';

import '../../network/firebase_authentication.dart';

class ServiceConstants {
  static const _api_url = "https://mmo-bike-path-default-rtdb.europe-west1.firebasedatabase.app/";

  static final firebaseUrl = _api_url.json;

  static const users = "$_api_url/users";

  static const reports = "$_api_url/reports";

  static final userId = FirebaseEmailAuth.instance.auth.currentUser!.uid;

  static final currentUser = "$_api_url/users/$userId".json;
}
