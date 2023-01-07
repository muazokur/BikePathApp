import 'dart:io';

import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:bike_path_app/core/extensions/string_extension.dart';
import 'package:bike_path_app/core/network/firebase_storage.dart';
import 'package:bike_path_app/view/user/model/user_model.dart';
import 'package:bike_path_app/view/user/profile/service/profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
part 'profile_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel, ProfileService {
  final ImagePicker imagePicker = ImagePicker();
  late String reportText;
  late String pointText;
  @observable
  XFile? imageUrl;

  @observable
  bool imageIsTrue = false;

  @observable
  bool isLoading = false;
  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @override
  bool update(String key, dynamic value) {
    return true;
  }

  @override
  void init() async {
    reportText = LocaleKeys.profile_page_sum_report.locale;
    pointText = LocaleKeys.profile_page_point.locale;
    await getUser();
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @action
  Future<void> getImageUrl(ImageSource source) async {
    imageUrl = await imagePicker.pickImage(source: source);

    if (imageUrl != null) {
      imageIsTrue = true;
    }

    await changeProfileImage();
  }

  @observable
  UserModel? userModel;

  @action
  Future<void> getUser() async {
    userModel = await getProfile();
    isLoadingChange();
  }

  @action
  Future changeProfileImage() async {
    if (imageIsTrue) {
      var photoUrl = await FireStorage.instance.uploadMedia(File(imageUrl!.path), userModel!.email);
      userModel!.photoUrl = photoUrl;
      uploadProfilePhoto(photoUrl);
    }
  }
}
