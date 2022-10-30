import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bike_path_app/core/base/view/base_view.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:bike_path_app/view/_product/_widgets/button/general_elevated_button.dart';
import 'package:bike_path_app/view/user/create_report/view_model/create_report_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
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
                    )),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: context.paddingMedium,
                  child: Observer(builder: (_) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          viewModel.title ?? "none",
                          style: context.textThemeLight.headline4,
                        ),
                        AutoSizeText(
                          viewModel.description ?? "none",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.w300, height: 2),
                        ),
                        Container(
                          height: context.height * 0.10,
                          color: Colors.blueGrey,
                          child: Text("HARİTA"),
                        ),
                      ],
                    );
                  }),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
