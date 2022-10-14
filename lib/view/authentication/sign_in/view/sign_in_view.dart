import 'package:bike_path_app/core/base/view/base_view.dart';
import 'package:bike_path_app/core/init/theme/light/color_scheme_light.dart';
import 'package:bike_path_app/view/authentication/sign_in/view_model/sign_in_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/text_fields/email_text_field.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
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
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                color: Theme.of(context).cardColor,
              ),
              Container(
                height: 60,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              EmailTextField(controller: emailController),
            ],
          ),
        );
      },
    );
  }
}
