import 'package:bike_path_app/core/constants/navigation/navigation_constant.dart';
import 'package:bike_path_app/core/init/navigation/navigation_service.dart';
import 'package:bike_path_app/view/user/profile/view/profile_view.dart';
import 'package:bike_path_app/view/user/report/view/report_view.dart';
import 'package:flutter/material.dart';
import '../../core/components/appbar/circular_appbar.dart';
import '../_product/_widgets/appbar/bottom_appbar.dart';

class UserMainView extends StatelessWidget {
  const UserMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CircularAppBar(),
        body: TabBarView(
          children: [
            ReportView(),
            ProfileView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              NavigationService.instance.navigedToPage(path: NavigationConstants.createReportPage);
            },
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const ProductBottomAppBar(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
