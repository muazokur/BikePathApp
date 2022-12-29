import 'package:bike_path_app/core/components/appbar/circular_appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../_product/_widgets/card/report_card.dart';
import '../../user/report/view_model/index_controller.dart';
import '../../user/report/view_model/report_view_model.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({Key? key}) : super(key: key);

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
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
        return Scaffold(
          appBar: CircularAppBar(),
          body: Padding(
            padding: context.paddingLow,
            child: Observer(builder: (_) {
              return viewModel.isLoading == false
                  ? Center(child: SizedBox())
                  : Observer(builder: (_) {
                      return Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                            shrinkWrap: true,
                            dragStartBehavior: DragStartBehavior.start,
                            itemCount: viewModel.reportList!.length,
                            itemBuilder: (context, index) {
                              //int reverseIndex = (viewModel.reportList!.length - 1) - index;
                              int reverseIndex = index;
                              print(viewModel.reportList!.length);
                              return ReportCard(
                                title: viewModel.reportList![reverseIndex].title,
                                subtitle: viewModel.reportList![reverseIndex].description,
                                leadingCircleAvatar: viewModel.reportList![reverseIndex].photo,
                                tralling: viewModel.reportList![reverseIndex].date,
                                onTap: () {
                                  IndexController.instance.changeIndex(reverseIndex);
                                  NavigationService.instance
                                      .navigedToPage(path: NavigationConstants.employeeStateView);
                                },
                                likeCount: viewModel.reportList![reverseIndex].likeCount,
                                commentCount: viewModel.reportList![reverseIndex].commentCount,
                                id: viewModel.reportList![reverseIndex].key,
                              );
                            }),
                      );
                    });
            }),
          ),
        );
      },
    );
  }
}
