import 'package:bike_path_app/core/components/errors/not_found_navigation.dart';
import 'package:bike_path_app/core/constants/app/app_constant.dart';
import 'package:bike_path_app/core/constants/navigation/navigation_constant.dart';
import 'package:bike_path_app/core/init/navigation/navigation_service.dart';
import 'package:bike_path_app/core/init/theme/light/app_theme_light.dart';
import 'package:bike_path_app/view/authentication/sign_in/view/sign_in_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/init/navigation/navigation_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: ApplicationConstant.LANG_PATH,
      supportedLocales: ApplicationConstant.SUPPORTED_LOCALE,
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
      onGenerateRoute: NavigationRoute.instance.onGenerateRoute,
      initialRoute: NavigationConstants.signInPage,
      navigatorKey: NavigationService.instance.navigatorKey,
      //home: const SignInView(),
    );
  }
}
