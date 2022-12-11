import '../../../../core/network/firebase_authentication.dart';

class SignInService {
  Future<bool> signIn(String email, String password) {
    return FirebaseEmailAuth.instance.signIn(email, password);
  }
}
