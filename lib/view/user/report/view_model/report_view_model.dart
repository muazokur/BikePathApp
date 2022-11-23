import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'report_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ReportViewModel = _ReportViewModelBase with _$ReportViewModel;

abstract class _ReportViewModelBase with Store, BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => baseContext = context;

  @observable
  String? title = "Yazı Silinmesi";
  @observable
  String? description = "Bosna Hersek otobüs durağının karşısındaki yolda yazı silinmiş";

  ///Image process
  @observable
  XFile? imageUrl = XFile(
      "/data/user/0/com.example.bike_path_app/cache/16655b5d-ce35-4f5c-b03a-80cd4a10ae755908002090746175.jpg");
}
