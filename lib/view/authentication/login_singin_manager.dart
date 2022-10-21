import 'package:bike_path_app/core/base/view/base_view.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:bike_path_app/view/authentication/login/view/login_view.dart';
import 'package:bike_path_app/view/authentication/login/view_model/login_view_model.dart';
import 'package:bike_path_app/view/authentication/sign_in/view/sign_in_view.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/string_extension.dart';
import '../../core/init/lang/locale_keys.g.dart';
import '../_product/_constants/image_path_png.dart';

class LoginSignInManagerView extends StatelessWidget {
  const LoginSignInManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (viewModel) {
        viewModel.init();
        viewModel.setContext(context);
      },
      onPageBuilder: (context, viewModel) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            key: viewModel.scaffoldState,
            body: SafeArea(
              child: Column(
                children: [
                  buildAnimatedContainer(context),
                  buildContainerTabBar(context),
                  Expanded(
                    flex: 6,
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: context.paddingMediumHorizontal,
                          child: const LoginView(),
                        ),
                        const SignInView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
        color: Colors.white,
        height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
        duration: context.lowDuration,
        child: Center(child: Image.asset(PNGImagePaths.instance.loginPerson)));
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 5),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: context.textTheme.headline5,
      unselectedLabelStyle: context.textTheme.headline5,
      indicatorColor: context.theme.dividerColor,
      indicatorWeight: 5,
      tabs: [
        Tab(text: LocaleKeys.login_signin_page_login.locale),
        Tab(text: LocaleKeys.login_signin_page_sign_in.locale),
      ],
    );
  }

  TabBarView buildTabbarView(BuildContext context) {
    return TabBarView(
      children: [
        InkWell(
          child: const Tab(text: "log"),
          onTap: () {
            print("login page");
          },
        ),
        InkWell(
          child: const Tab(text: "sign"),
          onTap: () {
            print("sign page");
          },
        ),
      ],
    );
  }
}
