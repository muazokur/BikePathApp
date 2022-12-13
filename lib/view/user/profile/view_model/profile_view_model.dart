import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:bike_path_app/core/base/network/base_service.dart';
import 'package:bike_path_app/core/extensions/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/constants/enums/service_enums.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
part 'profile_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  final ImagePicker imagePicker = ImagePicker();
  late String reportText;
  late String pointText;
  @observable
  XFile? imageUrl;

  @observable
  bool imageIsTrue = false;

  @override
  void init() {
    reportText = LocaleKeys.profile_page_sum_report.locale;
    pointText = LocaleKeys.profile_page_point.locale;
    getProfile();
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @action
  Future<void> getImageUrl(ImageSource source) async {
    imageUrl = await imagePicker.pickImage(source: source);
    if (imageUrl != null) {
      print(imageUrl!.path);
      imageIsTrue = true;
    }
    print(imageIsTrue);
  }

  Future<void> getProfile() async {
    BaseService.instance.get(Service.Users.get);
  }
}
