import 'package:bike_path_app/core/constants/service/service_constants.dart';
import 'package:bike_path_app/view/user/create_report/model/report_model.dart';

import '../../../../core/base/network/base_service.dart';
import '../../../../core/constants/enums/service_enums.dart';

class CreateReportService {
  Future<bool> addReport(String imagreUrl, String title, String description, List<double> location,
      String date, String address) async {
    var currentUser = ServiceConstants.userId;

    // List<ReportModel> reportModel =
    //     await BaseService.instance.get<ReportModel>(Service.Reports.get, ReportModel.empty());
    // print(reportModel[0].id);
    // print(reportModel[1].id);
    //print(reportModel[2].description);
    //print(location);
    var result = await BaseService.instance.postReport(currentUser, Service.Reports.get, imagreUrl,
        title, description, location, date, address, false);

    return result;
  }
}
