import 'package:bike_path_app/core/constants/enums/report_model_enum.dart';

import '../../../../core/base/network/base_service.dart';
import '../../../../core/constants/enums/service_enums.dart';
import '../../create_report/model/report_model.dart';

class ReportService {
  Future<List<ReportModel>?> getReports() async {
    try {
      List<ReportModel> reportModel =
          await BaseService.instance.get<ReportModel>(Service.Reports.get, ReportModel.empty());

      return reportModel;
    } catch (e) {
      return null;
    }
  }

  Future updateLike(String id, dynamic value) async {
    var url = Service.Reports.getParam(id);
    await BaseService.instance.update(url, ReportModelEnum.likeCount.name, value);
  }

  Future addComment(String reportId, String value) async {
    var url = Service.ReportsComments.getParam(reportId);
    List<CommentId> commentList = await BaseService.instance.get<CommentId>(url, CommentId.empty());
    for (int i = 0; i < commentList.length; i++) {
      print("${commentList[i].id} + + ${commentList[i].comment}");
    }

    //print(a.runtimeType);
    //print(commentId.runtimeType);
    //print("şeet");
    // print(url);
    // print(reportId);
    // print(value);
  }

  Future getComment(String reportId) async {
    var url = Service.ReportsComments.getParam(reportId);
    List<CommentId> commentList = await BaseService.instance.get<CommentId>(url, CommentId.empty());

    return commentList;
  }
}
