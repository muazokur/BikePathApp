import '../service/service_constants.dart';
import 'package:bike_path_app/core/extensions/string_extension.dart';

enum Service { Users, CurrentUser, Reports, ReportsComments, CurrentUserId }

extension ServiceExtension on Service {
  String getParam(String param) {
    switch (this) {
      case Service.Reports:
        return "${ServiceConstants.reports}/$param".json;
      case Service.ReportsComments:
        return "${ServiceConstants.reports}/$param/${ServiceConstants.comments}".json;
      case Service.Users:
        return "${ServiceConstants.currentUser}/$param".json;
      case Service.CurrentUser:
        return "${ServiceConstants.users}/$param".json;

      default:
        return 'Error Type';
    }
  }

  String get get {
    switch (this) {
      case Service.Users:
        return ServiceConstants.users.json;
      case Service.CurrentUserId:
        return ServiceConstants.userId;
      case Service.CurrentUser:
        return ServiceConstants.currentUser;
      case Service.Reports:
        return ServiceConstants.reports.json;
      default:
        return 'Error Type';
    }
  }
}
