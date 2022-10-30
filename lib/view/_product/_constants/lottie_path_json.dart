import '../../../core/extensions/string_extension.dart';

class JSONLottiePaths {
  static final JSONLottiePaths _instance = JSONLottiePaths._init();
  static JSONLottiePaths get instance => _instance;
  JSONLottiePaths._init();

  final splashLottieJSON = "splash_bicycle".toJSON;
  final uploadImageLottieJSON = "upload_image".toJSON;
  final takeLocationLottieJSON = "take_location".toJSON;
}
