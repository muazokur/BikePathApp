import 'package:bike_path_app/core/init/navigation/navigation_service.dart';
import 'package:flutter/widgets.dart';

abstract class BaseViewModel {
  BuildContext? baseContext;
  NavigationService navigation = NavigationService.instance;
  void setContext(BuildContext context);
  void init();
}
