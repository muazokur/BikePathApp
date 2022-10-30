import 'package:bike_path_app/core/extensions/context_extension.dart';
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
    super.initState();
    print("ohara");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingMedium,
        child: Center(
          child: Column(
            children: [
              LottieWidget(path: JSONLottiePaths.instance.splashLottieJSON),
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
