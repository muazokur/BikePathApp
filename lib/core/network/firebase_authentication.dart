import 'package:bike_path_app/core/base/network/base_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseEmailAuth extends BaseAuthentication {
  static final FirebaseEmailAuth _instance = FirebaseEmailAuth._init();
  static FirebaseEmailAuth get instance => _instance;
  FirebaseEmailAuth._init();

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      var credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return credential.user!;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<bool> logIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (error) {
      print(error.code);
      return false;
    }
  }
}
