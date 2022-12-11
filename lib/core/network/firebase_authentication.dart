import 'package:bike_path_app/core/base/network/base_authentication.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseEmailAuth extends BaseAuthentication {
  static final FirebaseEmailAuth _instance = FirebaseEmailAuth._init();
  static FirebaseEmailAuth get instance => _instance;
  FirebaseEmailAuth._init();

  var au = FirebaseAuth.instance;

  @override
  Future<bool> signIn(String email, String password) async {
    try {
      final credential = await au.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
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
