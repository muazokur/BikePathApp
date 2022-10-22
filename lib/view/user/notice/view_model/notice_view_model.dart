import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'notice_view_model.g.dart';

class NoticeViewModel = _NoticeViewModelBase with _$NoticeViewModel;

abstract class _NoticeViewModelBase with Store, BaseViewModel {
  @override
  void init() {}
  @override
  void setContext(BuildContext context) => baseContext = context;
}
