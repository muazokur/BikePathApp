import 'package:bike_path_app/core/init/navigation/navigation_service_interface.dart';
import 'package:bike_path_app/view/authentication/sign_in/view/sign_in_view.dart';
import 'package:flutter/material.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  var removeAllOldRoutes = (Route<dynamic> route) => false;
  @override
  Future<void> navigedToPage(
      {required String path, required Object data}) async {
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!.pushNamed(path, arguments: data);
    }
  }

  @override
  Future<void> navigedToPageClear(
      {required String path, required Object data}) async {
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!
          .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
    }
  }
}
