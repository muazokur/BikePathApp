import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthentication {
  final FirebaseAuth auth = FirebaseAuth.instance;
  int a = 1;
  void signIn(String email, String password);
  void logIn(String email, String password);
}
