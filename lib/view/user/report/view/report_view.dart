import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../_product/_widgets/card/report_card.dart';
import '../view_model/report_view_model.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  List<int> list = [];
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
          child: Observer(builder: (_) {
            return viewModel.isLoading == false
                ? Center(child: CircularProgressIndicator())
                : Observer(builder: (_) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                          shrinkWrap: true,
                          dragStartBehavior: DragStartBehavior.start,
                          itemCount: viewModel.reportList!.length,
                          itemBuilder: (context, index) {
                            int reverseIndex = (viewModel.reportList!.length - 1) - index;
                            return ReportCard(
                              title: viewModel.reportList![reverseIndex].title,
                              subtitle: viewModel.reportList![reverseIndex].description,
                              leadingCircleAvatar: viewModel.reportList![reverseIndex].photo,
                              tralling: viewModel.reportList![reverseIndex].date,
                              onTap: () {
                                NavigationService.instance
                                    .navigedToPage(path: NavigationConstants.reportStatePage);
                              },
                              likeCount: viewModel.reportList![reverseIndex].likeCount,
                              commentCount: viewModel.reportList![reverseIndex].commentCount,
                              id: viewModel.reportList![reverseIndex].key,
                            );
                          }),
                    );
                  });
          }),
        );
      },
    );
  }
}
