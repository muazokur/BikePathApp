import '../service/service_constants.dart';

enum Service {
  Users,
}

extension ServiceExtension on Service {
  String get get {
    switch (this) {
      case Service.Users:
        return ServiceConstants.users;
      default:
        return 'Error Type';
    }
  }
}
