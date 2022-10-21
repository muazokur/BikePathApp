// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bike_path_app/view/_product/_widgets/text_input/icon_container.dart';
import 'package:flutter/material.dart';

import 'package:bike_path_app/core/extensions/string_extension.dart';

import '../../../../core/init/lang/locale_keys.g.dart';

class EmailProductTextFormField extends StatelessWidget {
  const EmailProductTextFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) =>
          value!.isValidEmail == true ? null : LocaleKeys.login_signin_page_email_validate.locale,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_signin_page_email.locale,
        icon: const IconContainer(icon: Icons.email),
      ),
    );
  }
}
