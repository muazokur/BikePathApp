import 'package:bike_path_app/core/base/view/base_view.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:bike_path_app/core/extensions/string_extension.dart';
import 'package:bike_path_app/view/authentication/login/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../_product/_constants/image_path_png.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
                    child: Padding(
                      padding: context.paddingMedium,
                      child: buildForm(viewModel, context),
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
      tabs: const [Tab(text: "login"), Tab(text: "sign up")],
    );
  }

  Form buildForm(LoginViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          const Spacer(flex: 1),
          Padding(
            padding: context.paddingLowVertical,
            child: buildFormFieldEmail(context, viewModel),
          ),
          buildFormFieldPassword(context, viewModel),
          Padding(
            padding: context.paddingLowVertical,
            child: Align(alignment: Alignment.centerRight, child: buildTextForgot()),
          ),
          Padding(
            padding: context.paddingLowVertical,
            child: Center(
              child: loginButton(context, viewModel),
            ),
          ),
          buildWrapSignUp(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  TextFormField buildFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmail == true ? null : "Email doesn't found valid ",
      decoration: InputDecoration(
        labelText: "Email",
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Widget buildFormFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: (value) => value!.isNotEmpty ? null : "This fiel required",
        obscureText: !viewModel.isLockOpen,
        decoration: InputDecoration(
          labelText: "Password",
          icon: buildContainerIconField(context, Icons.key),
          suffix: InkWell(
            onTap: () {
              viewModel.isLockStateChange();
            },
            child: Observer(builder: (_) {
              return Icon(viewModel.isLockOpen ? Icons.lock_open : Icons.lock,
                  color: context.theme.dividerColor);
            }),
          ),
        ),
      );
    });
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      padding: context.paddingLow,
      decoration: BoxDecoration(
        color: context.theme.dividerColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  Text buildTextForgot() => const Text("forgot password");

  ElevatedButton loginButton(BuildContext context, LoginViewModel viewModel) {
    return ElevatedButton(
      onPressed: () {
        viewModel.fetchLoginService();
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => context.theme.primaryColor),
          padding: MaterialStateProperty.resolveWith((states) => context.paddingNormal),
          shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Center(
          child: Text(
        "Login",
        style: context.textThemeLight.headline5,
      )),
    );
  }

  Wrap buildWrapSignUp() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text("Don't have a account"),
        TextButton(onPressed: () {}, child: const Text("sign up"))
      ],
    );
  }
}
