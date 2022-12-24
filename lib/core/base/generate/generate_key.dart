import 'package:uuid/uuid.dart';

class GenerateKey {
  static final GenerateKey _instance = GenerateKey._init();
  GenerateKey._init();
  static GenerateKey get instance => _instance;

  String createKey() {
    var uuid = Uuid();
    var key = uuid.v1();
    return key;
  }
}
