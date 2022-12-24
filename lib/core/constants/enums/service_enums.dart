import '../service/service_constants.dart';
import 'package:bike_path_app/core/extensions/string_extension.dart';

enum Service {
  Users,
  CurrentUser,
  Reports,
}

extension ServiceExtension on Service {
  String getParam(String param) {
    return "${ServiceConstants.reports}/$param".json;
  }

  String get get {
    switch (this) {
      case Service.Users:
        return ServiceConstants.users.json;
      case Service.CurrentUser:
        return ServiceConstants.currentUser;
      case Service.Reports:
        return ServiceConstants.reports.json;
      default:
        return 'Error Type';
    }
  }
}
