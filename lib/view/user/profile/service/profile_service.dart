import '../../../../core/base/network/base_service.dart';
import '../../../../core/constants/enums/service_enums.dart';
import '../../model/user_model.dart';

class ProfileService {
  Future getProfile() async {
    UserModel userModel =
        await BaseService.instance.get<UserModel>(Service.CurrentUser.get, UserModel.empty());
    print(userModel.name);
  }
}
