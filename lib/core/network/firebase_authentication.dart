import 'package:bike_path_app/core/base/network/base_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseEmailAuth extends BaseAuthentication {
  static final FirebaseEmailAuth _instance = FirebaseEmailAuth._init();
  static FirebaseEmailAuth get instance => _instance;
  FirebaseEmailAuth._init();

  var au = FirebaseAuth.instance;

  @override
  Future signIn(String email, String password) async {
    print("ok2");
    try {
      final credential = await au.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void logIn(String email, String password) async {
    print("lan");
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("girdi");
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print("girmedi");
      }
    }
  }
}
