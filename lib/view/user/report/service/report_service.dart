import 'package:bike_path_app/core/constants/enums/report_model_enum.dart';
import 'package:bike_path_app/view/user/model/user_model.dart';
import 'package:bike_path_app/view/user/profile/service/profile_service.dart';

import '../../../../core/base/network/base_service.dart';
import '../../../../core/constants/enums/service_enums.dart';
import '../../../../core/constants/enums/user_model.enum.dart';
import '../../create_report/model/report_model.dart';

class ReportService {
  Future<List<ReportModel>?> getReports() async {
    try {
      List<ReportModel> reportModel =
          await BaseService.instance.get<ReportModel>(Service.Reports.get, ReportModel.empty());

      reportModel.sort((a, b) => (a.date.toString()).compareTo(b.date.toString()));
      return reportModel.reversed.toList();
    } catch (e) {
      return null;
    }
  }

  Future updateLike(String id, dynamic value) async {
    var url = Service.Reports.getParam(id);
    await BaseService.instance.update(url, ReportModelEnum.likeCount.name, value);
  }

  Future updateReportState(String id, dynamic value) async {
    var url = Service.Reports.getParam(id);
    await BaseService.instance.update(url, ReportModelEnum.state.name, value);
  }

  Future updateNotification(String userId) async {
    ProfileService profileService = ProfileService();
    UserModel user = await profileService.getUserProfile(userId);
    print(user.point);
    int newPoint = user.point + 10;
    print(newPoint);
    await BaseService.instance
        .update(Service.User.getParam(userId), UserModelEnum.point.name, newPoint);
  }

  Future addComment(String reportId, String value) async {
    var url = Service.ReportsComments.getParam(reportId);
    await BaseService.instance.addComment(url, Service.CurrentUserId.get, value,
        UserModelCache.userName, UserModelCache.surName, UserModelCache.photoUrl);
  }

  Future getComment(String reportId) async {
    try {
      var url = Service.ReportsComments.getParam(reportId);
      List<CommentId> commentList =
          await BaseService.instance.get<CommentId>(url, CommentId.empty());

      return commentList;
    } catch (e) {
      return null;
    }
  }
}
