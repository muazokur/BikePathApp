import '../service/service_constants.dart';

enum Service {
  Users,
  CurrentUser,
  Reports,
}

extension ServiceExtension on Service {
  String get get {
    switch (this) {
      case Service.Users:
        return ServiceConstants.users;
      case Service.CurrentUser:
        return ServiceConstants.currentUser;
      case Service.Reports:
        return ServiceConstants.reports;
      default:
        return 'Error Type';
    }
  }
}
