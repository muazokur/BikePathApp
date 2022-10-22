import 'package:bike_path_app/core/base/view/base_view.dart';
import 'package:bike_path_app/core/components/appbar/circular_appbar.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:bike_path_app/view/user/notice/view_model/notice_view_model.dart';
import 'package:flutter/material.dart';

import '../../../_product/_widgets/appbar/bottom_appbar.dart';

class NoticeView extends StatelessWidget {
  const NoticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<NoticeViewModel>(
      viewModel: NoticeViewModel(),
      onModelReady: (viewModel) {
        viewModel.init();
        viewModel.setContext(context);
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
            appBar: const CircularAppBar(
              title: Text("Bike Path App"),
            ),
            body: Container(color: context.theme.scaffoldBackgroundColor),
            floatingActionButton:
                FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const ProductBottomAppBar());
      },
    );
  }
}
