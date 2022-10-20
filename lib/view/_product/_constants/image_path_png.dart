import '../../../core/extensions/string_extension.dart';

class PNGImagePaths {
  static final PNGImagePaths _instance = PNGImagePaths._init();
  static PNGImagePaths get instance => _instance;
  PNGImagePaths._init();

  final onBoardPNG = "onboard_login".toPNG;
  final shareLocationPNG = "share_location".toPNG;
  final takePhotoPNG = "take_photo".toPNG;

  final loginPerson = "login_person".toPNG;
}
