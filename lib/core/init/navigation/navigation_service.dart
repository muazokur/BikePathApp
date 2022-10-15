import 'package:bike_path_app/core/init/navigation/navigation_service_interface.dart';
import 'package:flutter/material.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  var removeAllOldRoutes = (Route<dynamic> route) => false;
  @override
  Future<void> navigedToPage({String? path, Object? data}) async {
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!.pushNamed(path!, arguments: data);
    }
  }

  @override
  Future<void> navigedToPageClear({String? path, Object? data}) async {
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!
          .pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
    }
  }
}
