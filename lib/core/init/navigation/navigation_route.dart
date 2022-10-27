import 'package:bike_path_app/core/constants/navigation/navigation_constant.dart';
import 'package:bike_path_app/view/authentication/login_singin_manager.dart';
import 'package:bike_path_app/view/authentication/sign_in/view/sign_in_view.dart';
import 'package:bike_path_app/view/user/report/view/report_view.dart';
import 'package:bike_path_app/view/user/user_main_view.dart';
import 'package:flutter/material.dart';

import '../../../view/authentication/login/view/login_view.dart';
import '../../../view/authentication/onboard/view/on_board_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic>? onGenerateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.signInPage:
        return normalNavigate(const SignInView());
      case NavigationConstants.loginPage:
        return normalNavigate(const LoginView());
      case NavigationConstants.onBoardPage:
        return normalNavigate(const OnBoardView());
      case NavigationConstants.loginSignInManager:
        return normalNavigate(const LoginSignInManagerView());
      case NavigationConstants.reportPage:
        return normalNavigate(const ReportView());
      case NavigationConstants.userMainPage:
        return normalNavigate(const UserMainView());
      // default:
      //   print("burda");
      //   return normalNavigate(const NotFoundNavigation());
    }
    return null;
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
