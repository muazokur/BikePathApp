import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:bike_path_app/core/extensions/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
part 'profile_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  late String reportText;
  late String pointText;
  @override
  void init() {
    reportText = LocaleKeys.profile_page_sum_report.locale;
    pointText = LocaleKeys.profile_page_point.locale;
  }

  @override
  void setContext(BuildContext context) => baseContext = context;
}
