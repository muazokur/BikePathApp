import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../_product/_constants/image_path_png.dart';
import '../../../_product/_widgets/card/report_card.dart';
import '../view_model/report_view_model.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ReportViewModel>(
      viewModel: ReportViewModel(),
      onModelReady: (viewModel) {
        viewModel.init();
        viewModel.setContext(context);
      },
      onPageBuilder: (context, viewModel) {
        return Padding(
          padding: context.paddingLow,
          child: ListView.builder(
            itemBuilder: (context, index) => ReportCard(
              title: "Yazı Silinmesi",
              subtitle: "Konya/Selçuklu",
              leadingCircleAvatar: PNGImagePaths.instance.onBoardPNG,
              tralling: "27.10.2022",
              onTap: () {
                NavigationService.instance.navigedToPage(path: NavigationConstants.reportStatePage);
              },
            ),
          ),
        );
      },
    );
  }
}
