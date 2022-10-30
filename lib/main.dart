import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/constants/app/app_constant.dart';
import 'core/constants/navigation/navigation_constant.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/light/app_theme_light.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeLight.instance.theme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      onGenerateRoute: NavigationRoute.instance.onGenerateRoute,
      initialRoute: NavigationConstants.splashPage,
      navigatorKey: NavigationService.instance.navigatorKey,
      //home: const OnBoardView(),
    );
  }
}
