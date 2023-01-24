import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:bike_path_app/view/user/create_report/model/report_model.dart';
import 'package:bike_path_app/view/user/report/service/report_service.dart';
import 'package:bike_path_app/view/user/report/view_model/index_controller.dart';
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
      "/data/user/0/com.example.bike_path_app_mmo2/cache/60699fd4-c28e-468a-b60a-63c0445dfd302743065780732726878.jpg");

  @observable
  List<ReportModel>? reportList;

  @action
  Future getReport() async {
    reportList = await getReports();
    if (reportList != null) {
      for (int i = 0; i < reportList!.length; i++) {}
      getReportComments(reportList![IndexController.onTapIndex].key.toString());
      isLoadingChange();
    }
  }

  @observable
  bool isLoadingComment = false;
  @action
  void isLoadingCommentChange() {
    isLoadingComment = !isLoadingComment;
  }

  @observable
  List<CommentId>? commentList = [];

  @action
  Future getReportComments(String reportId) async {
    commentList = await getComment(reportId);
  }

  @override
  bool update(String? key, dynamic value) {
    updateLike(key!, value);
    return true;
  }

  changeReportState(String? key, dynamic value) {
    updateReportState(key!, value);
  }

  changeReportPoint(String userId) {
    updateNotification(userId);
  }

  bool addReportComment(String reportId, dynamic value) {
    addComment(reportId, value);
    return true;
  }
}
