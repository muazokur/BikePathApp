import 'package:bike_path_app/view/user/create_report/model/report_model.dart';

import '../../../../core/base/network/base_service.dart';
import '../../../../core/constants/enums/service_enums.dart';

class ReportService {
  Future addReport() async {
    List<ReportModel> reportModel =
        await BaseService.instance.get<ReportModel>(Service.Reports.get, ReportModel.empty());
    print(reportModel[0].description);
    print(reportModel[1].description);
    print(reportModel[2].description);
  }
}
