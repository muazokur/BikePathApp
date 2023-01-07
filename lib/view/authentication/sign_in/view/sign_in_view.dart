import 'package:bike_path_app/core/base/view/base_view.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:bike_path_app/core/extensions/string_extension.dart';
import 'package:bike_path_app/view/_product/_widgets/button/general_elevated_button.dart';
import 'package:bike_path_app/view/_product/toast_message.dart';
import 'package:bike_path_app/view/authentication/sign_in/view_model/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/components/text_field/icon_text_form_field.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_widgets/text_input/email_text_form_field.dart';
import '../../../_product/_widgets/text_input/icon_container.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController(); //kaldır

  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
      viewModel: SignInViewModel(),
      onModelReady: (viewModel) {
        viewModel.init();
        viewModel.setContext(context);
      },
      onPageBuilder: (BuildContext context, viewModel) {
        return Scaffold(
          key: viewModel.scaffoldState,
          body: Form(
            key: viewModel.formState,
            autovalidateMode: AutovalidateMode.always,
            child: SingleChildScrollView(
              child: Padding(
                padding: context.paddingMedium,
                child: Column(
                  children: [
                    EmailProductTextFormField(
                      controller: viewModel.emailController,
                    ),
                    IconTextFormField(
                        controller: viewModel.nameController,
                        labelText: LocaleKeys.login_signin_page_name.locale,
                        icon: Icons.person_remove_sharp),
                    IconTextFormField(
                        controller: viewModel.surnameController,
                        labelText: LocaleKeys.login_signin_page_surname.locale,
                        icon: Icons.person_remove_sharp),
                    buildFormFieldPassword(context, viewModel),
                    Padding(
                      padding: context.paddingLowVertical,
                      child: GeneralElevatedButton(
                          onPressed: () async {
                            var message = await viewModel.fetchSingInService();
                            //print(textFieldsIsTrue);
                            switch (message) {
                              case LoginState.Successful:
                                ToastMessage.toast("Kayıt başarılı");

                                break;
                              case LoginState.FormStateError:
                                ToastMessage.toast("Lüften alanları kontrol ediniz");
                                break;
                              case LoginState.ServiceStateError:
                                ToastMessage.toast("E-mail veya şifre geçersiz");

                                break;
                            }
                          },
                          text: "Sign in"),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildFormFieldPassword(BuildContext context, SignInViewModel viewModel) {
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
