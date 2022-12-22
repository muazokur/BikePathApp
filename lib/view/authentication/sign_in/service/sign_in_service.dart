import 'package:bike_path_app/core/base/network/base_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/enums/service_enums.dart';
import '../../../../core/network/firebase_authentication.dart';

class SignInService {
  Future<User?> signIn(String email, String password) {
    return FirebaseEmailAuth.instance.signIn(email, password);
  }

  Future<bool> dbRegister(String id, String email, String name, String surname) {
    return BaseService.instance.post(Service.Users.get, id, email, name, surname);
  }
}
