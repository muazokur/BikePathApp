// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bike_path_app/core/extensions/string_extension.dart';
import 'package:bike_path_app/core/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'package:bike_path_app/view/_product/_widgets/text_input/icon_container.dart';

class IconTextFormField extends StatelessWidget {
  const IconTextFormField({
    Key? key,
    required this.controller,
    this.icon,
    required this.labelText,
  }) : super(key: key);
  final TextEditingController controller;
  final IconData? icon;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) =>
          value?.isEmpty == true ? LocaleKeys.login_signin_page_text_field_validate.locale : null,
      decoration: InputDecoration(
        labelText: labelText,
        icon: IconContainer(
          icon: icon ?? Icons.not_interested_sharp,
        ),
      ),
    );
  }
}
