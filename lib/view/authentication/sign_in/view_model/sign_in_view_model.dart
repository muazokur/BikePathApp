import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'sign_in_view_model.g.dart';

class SignInViewModel = SignInViewModelBase with _$SignInViewModel;

abstract class SignInViewModelBase with Store, BaseViewModel {
  @override
  void init() {}
  @override
  void setContext(BuildContext context) => baseContext = context;

  @observable
  late String email;

  @observable
  late String password;
}
