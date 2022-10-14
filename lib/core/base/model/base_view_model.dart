import 'package:flutter/widgets.dart';

abstract class BaseViewModel {
  BuildContext? baseContext;
  void setContext(BuildContext context);
  void init();
}
