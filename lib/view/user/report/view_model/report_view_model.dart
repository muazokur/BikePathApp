import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:bike_path_app/view/user/create_report/model/report_model.dart';
import 'package:bike_path_app/view/user/report/service/report_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'report_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ReportViewModel = _ReportViewModelBase with _$ReportViewModel;

abstract class _ReportViewModelBase with Store, BaseViewModel, ReportService {
  @override
  void init() {
    getReport();
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @observable
  bool isLoading = false;
  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @observable
  String? title = "Yazi Silinmesi";
  @observable
  String? description = "Bosna Hersek otobüs durağinin karşisindaki yolda yazi silinmiş";

  ///Image process
  @observable
  XFile? imageUrl = XFile(
      "/data/user/0/com.example.bike_path_app_mmo1/cache/16655b5d-ce35-4f5c-b03a-80cd4a10ae755908002090746175.jpg");

  @observable
  List<ReportModel>? reportList;

  @action
  Future getReport() async {
    reportList = await getReports();
    for (int i = 0; i < reportList!.length; i++) {
      print(reportList![i].title);
    }
    isLoadingChange();
  }

  @override
  bool update(String? key, dynamic value) {
    updateLike(key!, value);
    return true;
  }
}
