import '../../../../core/network/firebase_authentication.dart';

class LoginService {
  Future<bool> logIn(String email, String password) async {
    return await FirebaseEmailAuth.instance.logIn(email, password);
  }
}
