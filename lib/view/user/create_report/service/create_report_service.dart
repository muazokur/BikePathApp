import 'package:bike_path_app/core/constants/service/service_constants.dart';
import 'package:bike_path_app/view/user/model/user_model.dart';

import '../../../../core/base/network/base_service.dart';
import '../../../../core/constants/enums/service_enums.dart';
import '../../../../core/constants/enums/user_model.enum.dart';

class CreateReportService {
  Future<bool> addReport(String imagreUrl, String title, String description, List<double> location,
      String date, String address) async {
    var currentUser = ServiceConstants.userId;
    var result = await BaseService.instance.postReport(
        currentUser,
        Service.Reports.get,
        imagreUrl,
        title,
        description,
        location,
        date,
        address,
        false,
        UserModelCache.userName,
        UserModelCache.surName);
    updateNotification();
    return result;
  }

  updateNotification() {
    var sumNotification = UserModelCache.sumNotification + 1;
    BaseService.instance
        .update(Service.CurrentUser.get, UserModelEnum.sumNotification.name, sumNotification);
  }
}
