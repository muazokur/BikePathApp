import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../user/create_report/model/report_model.dart';
import '../service/employee_service.dart';
part 'employee_view_model.g.dart';

// ignore: library_private_types_in_public_api
class EmployeeViewModel = _EmployeeViewModelBase with _$EmployeeViewModel;

abstract class _EmployeeViewModelBase with Store, BaseViewModel, EmployeeService {
  @override
  void init() {
    getReport();
  }

  @observable
  bool isLoading = false;
  @action
  isLoadingChange() {
    isLoading = !isLoading;
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  bool update(String key, dynamic value) {
    return true;
  }

  @observable
  List<ReportModel>? reportList = [];

  getReport() async {
    reportList = await getReports();
    isLoadingChange();
  }
}
