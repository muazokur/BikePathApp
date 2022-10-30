import 'package:bike_path_app/core/constants/navigation/navigation_constant.dart';
import 'package:bike_path_app/core/extensions/context_extension.dart';
import 'package:bike_path_app/core/init/navigation/navigation_service.dart';
import 'package:bike_path_app/view/_product/_constants/lottie_path_json.dart';
import 'package:bike_path_app/view/_product/_widgets/lottie/lottie_widget.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        NavigationService.instance.navigedToPageClear(path: NavigationConstants.onBoardPage);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: context.halfScreenVerticalValue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: LottieWidget(path: JSONLottiePaths.instance.splashLottieJSON)),
              Text(
                "Bike Path Application Hoş Geldiniz",
                style: context.textThemeLight.headline7,
              )
            ],
          ),
        ),
      ),
    );
  }
}
