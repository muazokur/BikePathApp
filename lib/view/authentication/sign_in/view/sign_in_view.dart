import 'package:auto_size_text/auto_size_text.dart';
import 'package:bike_path_app/core/base/view/base_view.dart';
import 'package:bike_path_app/core/constants/app/app_constant.dart';
import 'package:bike_path_app/core/constants/navigation/navigation_constant.dart';
import 'package:bike_path_app/core/init/lang/locale_keys.g.dart';
import 'package:bike_path_app/core/init/navigation/navigation_service.dart';
import 'package:bike_path_app/view/authentication/login/view/login_view.dart';
import 'package:bike_path_app/view/authentication/sign_in/view_model/sign_in_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/text/locale_text.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
      viewModel: SignInViewModel(),
      onModelReady: (model) {},
      onPageBuilder: (BuildContext context, model) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("data"),
            leading: TextButton(
                onPressed: () {
                  NavigationService.instance.navigedToPage(
                      path: NavigationConstants.loginPage,
                      data: const LoginView());
                },
                child: const Text(
                  "Selam",
                  style: TextStyle(color: Colors.black),
                )),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    context.setLocale(ApplicationConstant.TR_LOCALE);
                  },
                  child: AutoSizeText(context.locale.languageCode))
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                color: Theme.of(context).cardColor,
              ),
              const LocaleText(text: LocaleKeys.sign_in_hello),
              const LocaleText(text: LocaleKeys.trying),
              Container(
                height: 60,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
