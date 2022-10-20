import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_constants/image_path_png.dart';
import '../model/on_board_model.dart';

part 'on_board_view_model.g.dart';

// ignore: library_private_types_in_public_api
class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void init() {
    onBoardItems.add(OnBoardModel(
        LocaleKeys.on_page_login_question,
        LocaleKeys.on_page_login_question_explanation,
        PNGImagePaths.instance.onBoardPNG));
    onBoardItems.add(OnBoardModel(
        LocaleKeys.on_page_take_photo,
        LocaleKeys.on_page_take_photo_explanation,
        PNGImagePaths.instance.takePhotoPNG));
    onBoardItems.add(OnBoardModel(
        LocaleKeys.on_page_share_location,
        LocaleKeys.on_page_share_location_explanation,
        PNGImagePaths.instance.shareLocationPNG));
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = false;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    if (navigation.navigatorKey.currentState != null) {
      await navigation.navigedToPage(path: NavigationConstants.loginPage);
    } else {}
    changeLoading();
  }
}
