import '../service/service_constants.dart';

enum Service {
  Users,
  CurrentUser,
}

extension ServiceExtension on Service {
  String get get {
    switch (this) {
      case Service.Users:
        return ServiceConstants.users;
      case Service.CurrentUser:
        return ServiceConstants.currentUser;
      default:
        return 'Error Type';
    }
  }
}
