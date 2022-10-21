import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'sign_in_view_model.g.dart';

class SignInViewModel = SignInViewModelBase with _$SignInViewModel;

abstract class SignInViewModelBase with Store, BaseViewModel {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController surnameController;
  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    surnameController = TextEditingController();
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

  @action
  bool fetchSingInService() {
    isLoadingChange();
    isLoadingChange();
    if (formState.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
