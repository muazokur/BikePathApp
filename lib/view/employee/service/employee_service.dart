import '../../../core/base/network/base_service.dart';
import '../../../core/constants/enums/service_enums.dart';
import '../../user/create_report/model/report_model.dart';

class EmployeeService {
  Future<List<ReportModel>?> getReports() async {
    try {
      List<ReportModel> reportModel =
          await BaseService.instance.get<ReportModel>(Service.Reports.get, ReportModel.empty());

      return reportModel;
    } catch (e) {
      return null;
    }
  }
}
