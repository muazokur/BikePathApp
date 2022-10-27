import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'report_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ReportViewModel = _ReportViewModelBase with _$ReportViewModel;

abstract class _ReportViewModelBase with Store, BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => baseContext = context;
}
