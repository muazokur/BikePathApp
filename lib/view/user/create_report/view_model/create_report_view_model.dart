import 'dart:io';

import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:bike_path_app/core/constants/navigation/navigation_constant.dart';
import 'package:bike_path_app/core/init/navigation/navigation_service.dart';
import 'package:bike_path_app/core/network/date_service.dart';
import 'package:bike_path_app/core/network/firebase_storage.dart';
import 'package:bike_path_app/view/user/create_report/service/create_report_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'create_report_view_model.g.dart';

// ignore: library_private_types_in_public_api

class CreateReportViewModel extends _CreateReportViewModelBase
    with _$CreateReportViewModel, CreateReportService {
  static CreateReportViewModel? _instance;
  static CreateReportViewModel get instance {
    _instance ??= CreateReportViewModel._init();
    return _instance!;
  }

  CreateReportViewModel._init();
}

abstract class _CreateReportViewModelBase with Store, BaseViewModel, CreateReportService {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  GlobalKey<FormState> formState = GlobalKey();
  final ImagePicker imagePicker = ImagePicker();

  @override
  void init() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  bool update(String key, dynamic value) {
    return true;
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  String reportPhotos = "reportPhotos";

  @observable
  bool locationIsTrue = false;
  @action
  void getLocation() {}

  @observable
  String? title;
  @observable
  String? description;

  List<double> location = [];

  ///Image process
  @observable
  XFile? imageUrl;
  @observable
  bool imageIsTrue = false;
  @action
  Future<void> getImageUrl(ImageSource source) async {
    imageUrl = await imagePicker.pickImage(source: source);
    if (imageUrl != null) {
      imageIsTrue = true;
    }
  }

  ///Image process

  @action
  bool createReport() {
    if (formState.currentState!.validate() && imageUrl != null) {
      title = titleController.text;
      description = descriptionController.text;
      NavigationService.instance.navigedToPage(path: NavigationConstants.acceptReportPage);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> acceptReport() async {
    try {
      var date = DateService.instance.getDate();
      var img = imageUrl!.path.toString();
      var photoUrl = await FireStorage.instance.uploadMedia(File(img), reportPhotos);
      var result =
          await addReport(photoUrl, title!, description!, location, date, "Mountain/California");

      return result;
    } catch (e) {
      return false;
    }
  }
}
