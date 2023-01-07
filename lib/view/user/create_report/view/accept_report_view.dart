import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bike_path_app/core/init/navigation/navigation_service.dart';
import 'package:bike_path_app/view/google_map/model/google_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../_product/_widgets/button/general_elevated_button.dart';
import '../../../_product/toast_message.dart';
import '../../../google_map/view/google_map_view.dart';
import '../view_model/create_report_view_model.dart';

class AcceptReportView extends StatelessWidget {
  const AcceptReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CreateReportViewModel.instance,
      onModelReady: (CreateReportViewModel viewModel) {
        viewModel.location = GoogleModel.instance.getCurrentLocation();
      },
      onPageBuilder: (context, CreateReportViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: reportPhotoContainer(context, viewModel),
              ),
              Expanded(
                flex: 6,
                child: contentPreviewColumn(context, viewModel),
              )
            ],
          ),
        );
      },
    );
  }

  Container reportPhotoContainer(BuildContext context, CreateReportViewModel viewModel) {
    return Container(
      color: Colors.transparent,
      width: context.width,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: FileImage(
              File(viewModel.imageUrl!.path),
            ),
          ),
        ),
      ),
    );
  }
}

Widget contentPreviewColumn(BuildContext context, CreateReportViewModel viewModel) {
  return Padding(
    padding: context.paddingMedium,
    child: Observer(builder: (_) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          titleText(viewModel, context),
          descriptionText(viewModel, context),
          googleMapContainer(context),
          acceptButton(viewModel),
          cancelButton(),
        ],
      );
    }),
  );
}

GeneralElevatedButton cancelButton() {
  return GeneralElevatedButton(
    onPressed: () {},
    text: "İptal Et",
    isCancel: true,
  );
}

GeneralElevatedButton acceptButton(CreateReportViewModel viewModel) => GeneralElevatedButton(
    onPressed: () async {
      var result = await viewModel.acceptReport();
      if (result) {
        ToastMessage.toast("Bildiri Oluşturuldu");
        NavigationService.instance.navigedToPageClear(path: NavigationConstants.userMainPage);
      }
    },
    text: "Onayla");

Container googleMapContainer(BuildContext context) {
  return Container(
    height: context.height * 0.25,
    color: Colors.blueGrey,
    child: GoogleMapView(isGetLocationButton: false),
  );
}

AutoSizeText descriptionText(CreateReportViewModel viewModel, BuildContext context) {
  return AutoSizeText(
    viewModel.description ?? "none",
    style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w300, height: 2),
  );
}

Text titleText(CreateReportViewModel viewModel, BuildContext context) {
  return Text(
    viewModel.title ?? "none",
    style: context.textThemeLight.headline4,
  );
}
