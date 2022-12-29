import 'package:bike_path_app/core/base/view/base_view.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:bike_path_app/view/_product/_widgets/text_input/icon_container.dart';
import 'package:bike_path_app/view/authentication/login/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_widgets/button/general_elevated_button.dart';
import '../../../_product/_widgets/text_input/email_text_form_field.dart';

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
        return Scaffold(
          key: viewModel.scaffoldState,
          body: Form(
            key: viewModel.formState,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: context.paddingMediumVertical,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: context.paddingLowVertical,
                      child: EmailProductTextFormField(controller: viewModel.emailController),
                    ),
                    buildFormFieldPassword(context, viewModel),
                    Padding(
                      padding: context.paddingLowVertical,
                      child: Align(alignment: Alignment.centerRight, child: buildTextForgot()),
                    ),
                    Padding(
                      padding: context.paddingLowVertical,
                      child: Center(
                        child: GestureDetector(
                          onLongPress: () async {
                            var state = await viewModel.fetchLoginServiceAdmin();
                            if (state) {
                              print("basarili");
                            } else {
                              print("basarisiz");
                            }
                          },
                          child: GeneralElevatedButton(
                            text: LocaleKeys.login_signin_page_login.locale,
                            onPressed: () async {
                              if (viewModel.emailController.text != "admin@admin.com" &&
                                  viewModel.passwordController.text != "admin123") {
                                var state = await viewModel.fetchLoginService();
                                //print(textFieldsIsTrue);
                                if (state) {
                                  print("basarili");
                                } else {
                                  print("basarisiz");
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    buildWrapSignUp(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
            child: EmailProductTextFormField(controller: viewModel.emailController),
          ),
          buildFormFieldPassword(context, viewModel),
          Padding(
            padding: context.paddingLowVertical,
            child: Align(alignment: Alignment.centerRight, child: buildTextForgot()),
          ),
          Padding(
            padding: context.paddingLowVertical,
            child: Center(
              child: GeneralElevatedButton(
                text: "Login",
                onPressed: () {
                  viewModel.fetchLoginService();
                },
              ),
            ),
          ),
          buildWrapSignUp(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget buildFormFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: (value) => value!.isNotEmpty
            ? null
            : LocaleKeys.login_signin_page_text_field_validate.locale.toString(),
        obscureText: !viewModel.isLockOpen,
        decoration: InputDecoration(
          labelText: LocaleKeys.login_signin_page_password.locale,
          icon: const IconContainer(icon: Icons.key),
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

  Text buildTextForgot() => Text(LocaleKeys.login_signin_page_forgot_password.locale);

  Wrap buildWrapSignUp() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(LocaleKeys.login_signin_page_have_account.locale),
        TextButton(onPressed: () {}, child: Text(LocaleKeys.login_signin_page_sign_up.locale))
      ],
    );
  }
}
