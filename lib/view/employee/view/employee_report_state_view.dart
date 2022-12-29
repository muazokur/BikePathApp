import 'package:auto_size_text/auto_size_text.dart';
import 'package:bike_path_app/view/user/report/view_model/index_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_titled_container/flutter_titled_container.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../_product/_constants/image_path_png.dart';
import '../../_product/_widgets/container/radius_container.dart';
import '../../user/report/view_model/report_view_model.dart';

class EmployeeReportStateView extends StatefulWidget {
  const EmployeeReportStateView({Key? key}) : super(key: key);

  @override
  State<EmployeeReportStateView> createState() => _EmployeeReportStateViewState();
}

class _EmployeeReportStateViewState extends State<EmployeeReportStateView> {
  @override
  void initState() {
    super.initState();
    print("INIT STATE");
  }

  @override
  Widget build(BuildContext context) {
    print("SETSTATE");
    return BaseView(
      viewModel: ReportViewModel(),
      onModelReady: (ReportViewModel viewModel) {
        viewModel.init();
        print("SETTTT");
      },
      onPageBuilder: (context, ReportViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          body: SizedBox.expand(
            child: Observer(builder: (_) {
              return viewModel.isLoading == false
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: context.height,
                      child: Column(
                        children: [
                          AnimatedContainer(
                              duration: context.lowDuration,
                              height: context.mediaQuery.viewInsets.bottom > 0
                                  ? 0
                                  : context.height * 0.3,
                              child: imageContainer(context, viewModel)),
                          Spacer(flex: 1),
                          Expanded(
                            flex: 20,
                            child: reportContainer(context, viewModel),
                          ),
                          Spacer(flex: 2),
                          Expanded(
                            flex: 38,
                            child: SingleChildScrollView(child: commentBuilder(context, viewModel)),
                          ),
                          Spacer(flex: 1),
                          Expanded(flex: 10, child: textFieldComment(context, viewModel)),
                          Spacer(flex: 1),
                        ],
                      ),
                    );
            }),
          ),
        );
      },
    );
  }

  Container imageContainer(BuildContext context, ReportViewModel viewModel) {
    return Container(
      color: Colors.transparent,
      width: context.width,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(viewModel.reportList![IndexController.onTapIndex].photo ?? "none"),
          ),
        ),
      ),
    );
  }
}

Widget reportContainer(BuildContext context, ReportViewModel viewModel) {
  return Padding(
    padding: context.paddingLowHorizontal,
    child: RadiusContainer(
      child: Observer(builder: (_) {
        return Padding(
          padding: context.paddingLow,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              titleText(viewModel, context),
              descriptionText(viewModel, context),
              SizedBox(
                height: context.height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  interactionRow(context, viewModel),
                  mapButton(),
                ],
              )
            ],
          ),
        );
      }),
    ),
  );
}

GestureDetector mapButton() {
  return GestureDetector(
    onTap: () {
      NavigationService.instance.navigedToPage(path: NavigationConstants.googleMapView);
    },
    child: Row(
      children: [
        Icon(Icons.location_on_outlined, color: Colors.black38),
        Text("Haritada gör"),
      ],
    ),
  );
}

Widget interactionRow(BuildContext context, ReportViewModel viewModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: context.paddingLow,
        child: InkWell(
          onTap: () {
            print("hop");
            if (viewModel.reportList![IndexController.onTapIndex].state == false) {
              viewModel.changeReportState(
                  viewModel.reportList![IndexController.onTapIndex].key, true);
            } else {
              viewModel.changeReportState(
                  viewModel.reportList![IndexController.onTapIndex].key, false);
            }
            viewModel.init();
            viewModel.isLoadingChange();
          },
          child: viewModel.reportList![IndexController.onTapIndex].state == false
              ? Text("Düzeltdi : Hayir")
              : Text("Düzeltdi : Evet"),
        ),
      ),
      Row(
        children: [
          Text("İlani Veren: "),
          Text(
              "${viewModel.reportList![IndexController.onTapIndex].userName} ${viewModel.reportList![IndexController.onTapIndex].userSurName}"),
        ],
      ),
    ],
  );
}

AutoSizeText descriptionText(ReportViewModel viewModel, BuildContext context) {
  return AutoSizeText(
    viewModel.reportList![IndexController.onTapIndex].description.toString(),
    style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w300, height: 2),
  );
}

Text titleText(ReportViewModel viewModel, BuildContext context) {
  return Text(
    viewModel.reportList![IndexController.onTapIndex].title ?? "none",
    style: context.textThemeLight.headline4,
  );
}

Widget commentBuilder(BuildContext context, ReportViewModel viewModel) {
  return Padding(
    padding: context.paddingLowHorizontal,
    child: Padding(
      padding: context.paddingLowVertical,
      child: TitledContainer(
        title: 'Yorumlar',
        fontSize: context.textTheme.subtitle1!.fontSize,
        child: RadiusContainer(
          child: commentsListView(context, viewModel),
        ),
      ),
    ),
  );
}

Widget commentsListView(BuildContext context, ReportViewModel viewModel) {
  return Observer(builder: (_) {
    return viewModel.commentList == null
        ? Center(
            child: Padding(
            padding: context.paddingHigh,
            child: Text("Henüz yorum yok"),
          ))
        : ListView.builder(
            itemCount: viewModel.commentList!.length,
            shrinkWrap: true,
            padding: context.paddingLowHorizontal,
            itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  style: ListTileStyle.drawer,
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: userImage(viewModel, index),
                  ),
                  isThreeLine: true,
                  title: Text(
                      "${viewModel.commentList![index].userName} ${viewModel.commentList![index].userSurname}"),
                  subtitle: Text(viewModel.commentList![index].comment.toString()),
                ),
                Divider(
                  color: Colors.black26,
                ),
              ],
            ),
          );
  });
}

Image userImage(ReportViewModel viewModel, int index) {
  if (viewModel.commentList![index].userPhotoUrl.toString() == "") {
    return Image.asset(
      PNGImagePaths.instance.mePNG,
      fit: BoxFit.fitWidth,
    );
  } else {
    return Image.network(viewModel.commentList![index].userPhotoUrl.toString());
  }
}

Padding textFieldComment(BuildContext context, ReportViewModel viewModel) {
  TextEditingController commentController = TextEditingController();

  return Padding(
    padding: context.paddingLowHorizontal,
    child: RadiusContainer(
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: 8, //or null
                controller: commentController,
                decoration: InputDecoration.collapsed(hintText: "Yorum Yazin"),
              ),
            ),
            InkWell(
              child: Text("Paylaş"),
              onTap: () {
                viewModel.addReportComment(
                    viewModel.reportList![IndexController.onTapIndex].key as String,
                    commentController.text);
                viewModel.init();
                viewModel.isLoadingChange();
                // viewModel.getReportComments(
                //     viewModel.reportList![IndexController.onTapIndex].key.toString());
              },
            )
          ],
        ),
      ),
    ),
  );
}
