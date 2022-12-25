import 'package:bike_path_app/core/constants/enums/user_model.enum.dart';

import '../../../../core/base/network/base_service.dart';
import '../../../../core/constants/enums/service_enums.dart';
import '../../model/user_model.dart';

class ProfileService {
  Future getProfile() async {
    UserModel userModel =
        await BaseService.instance.get<UserModel>(Service.CurrentUser.get, UserModel.empty());
    UserModelCache.userName = userModel.name;
    UserModelCache.surName = userModel.surname;
    UserModelCache.photoUrl = userModel.photoUrl;

    return userModel;
  }

  void uploadProfilePhoto(String url) {
    print("URL: $url");
    BaseService.instance.update(Service.CurrentUser.get, UserModelEnum.photoUrl.name, url);
  }
}
