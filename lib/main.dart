import 'package:bike_path_app/core/constants/app/app_constant.dart';
import 'package:bike_path_app/core/init/theme/light/app_theme_light.dart';
import 'package:bike_path_app/view/authentication/sign_in/view/sign_in_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: ApplicationConstant.LANG_PATH,
      supportedLocales: const [ApplicationConstant.TR_LOCALE],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeLight.instance.theme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      home: SignInView(),
    );
  }
}
