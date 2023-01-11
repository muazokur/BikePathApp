import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:bike_path_app/core/constants/navigation/navigation_constant.dart';
import 'package:bike_path_app/core/init/navigation/navigation_service.dart';
import 'package:bike_path_app/view/authentication/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

// ignore: library_private_types_in_public_api
class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel, LoginService {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  GlobalKey<FormState> formState = GlobalKey();

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @override
  bool update(String key, dynamic value) {
    return true;
  }

  @action
  Future<bool> fetchLoginService() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      var state = await logIn(emailController.text, passwordController.text);
      if (state) {
        NavigationService.instance.navigedToPageClear(path: NavigationConstants.userMainPage);
        return true;
      } else {
        return false;
      }
      //print("${emailController.text} ${passwordController.text}");
    } else {
      return false;
    }
  }

  @action
  Future<bool> fetchLoginServiceAdmin() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      var state = await logIn(emailController.text, passwordController.text);
      if (state) {
        NavigationService.instance.navigedToPage(path: NavigationConstants.employeeView);
        return true;
      } else {
        return false;
      }
      //print("${emailController.text} ${passwordController.text}");
    } else {
      return false;
    }
  }
}
