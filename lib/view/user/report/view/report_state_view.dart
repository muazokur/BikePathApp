import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_titled_container/flutter_titled_container.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../_product/_widgets/button/comment_button.dart';
import '../../../_product/_widgets/button/like_button.dart';
import '../../../_product/_widgets/container/radius_container.dart';
import '../view_model/report_view_model.dart';

class ReportStateView extends StatelessWidget {
  const ReportStateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ReportViewModel(),
      onModelReady: (ReportViewModel viewModel) {},
      onPageBuilder: (context, ReportViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: SizedBox(
              height: context.height,
              child: Column(
                children: [
                  AnimatedContainer(
                      duration: context.lowDuration,
                      height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
                      child: imageContainer(context, viewModel)),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 20,
                    child: reportContainer(context, viewModel),
                  ),
                  Spacer(flex: 2),
                  Expanded(
                    flex: 38,
                    child: commentBuilder(context),
                  ),
                  Spacer(flex: 1),
                  Expanded(flex: 10, child: textFieldComment(context)),
                  Spacer(flex: 1),
                ],
              ),
            ),
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
              image: FileImage(
                File(viewModel.imageUrl!.path),
              ),
            ),
          ),
        ));
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
                  interactionRow(context),
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
        Text("Haritada görmek için tıklayınız"),
      ],
    ),
  );
}

Row interactionRow(BuildContext context) {
  return Row(
    children: [
      LikeButton(),
      SizedBox(
        width: context.width * 0.020,
      ),
      CommentButton(
        onTap: () {},
      ),
    ],
  );
}

AutoSizeText descriptionText(ReportViewModel viewModel, BuildContext context) {
  return AutoSizeText(
    viewModel.description ?? "none",
    style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w300, height: 2),
  );
}

Text titleText(ReportViewModel viewModel, BuildContext context) {
  return Text(
    viewModel.title ?? "none",
    style: context.textThemeLight.headline4,
  );
}

Widget commentBuilder(BuildContext context) {
  return Padding(
    padding: context.paddingLowHorizontal,
    child: TitledContainer(
      title: 'Yorumlar',
      fontSize: context.textTheme.subtitle1!.fontSize,
      child: RadiusContainer(
        child: commentsListView(context),
      ),
    ),
  );
}

ListView commentsListView(BuildContext context) {
  return ListView.builder(
    shrinkWrap: true,
    padding: context.paddingLowHorizontal,
    itemBuilder: (context, index) => Column(
      children: [
        ListTile(
          style: ListTileStyle.drawer,
          leading: CircleAvatar(
            backgroundColor: Colors.amber,
          ),
          isThreeLine: true,
          title: Text("Mahmut Yıldırım"),
          subtitle: Text(
            "Bencede düzeltilmesi gerekir." * 3,
          ),
        ),
        Divider(
          color: Colors.black26,
        ),
      ],
    ),
  );
}

Padding textFieldComment(BuildContext context) {
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
                decoration: InputDecoration.collapsed(hintText: "Yorum Yazın"),
              ),
            ),
            InkWell(
              child: Text("Paylaş"),
              onTap: () {},
            )
          ],
        ),
      ),
    ),
  );
}
