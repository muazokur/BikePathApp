import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FireStorage {
  static final FireStorage _instance = FireStorage._init();
  FireStorage._init();
  static FireStorage get instance => _instance;

  Future<String> uploadMedia(File file, String email) async {
    try {
      FirebaseStorage firebaseStorage = FirebaseStorage.instance;
      var uploadTask = firebaseStorage
          .ref()
          .child("$email/${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}")
          .putFile(file);

      uploadTask.snapshotEvents.listen((event) {});

      String url = await (await uploadTask).ref.getDownloadURL();

      return url;
    } catch (e) {
      return "error";
    }
  }
}
