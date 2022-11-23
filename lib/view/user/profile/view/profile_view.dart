import 'package:bike_path_app/core/base/view/base_view.dart';
import 'package:bike_path_app/view/user/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../_product/_constants/image_path_png.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
        viewModel: ProfileViewModel(),
        onModelReady: (viewModel) {
          viewModel.init();
          viewModel.setContext(context);
        },
        onPageBuilder: (BuildContext context, viewModel) {
          return Padding(
            padding: context.paddingLow,
            child: SingleChildScrollView(
              child: Padding(
                padding: context.paddingMediumVertical,
                child: Container(
                  color: context.theme.scaffoldBackgroundColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: context.halfScreenVerticalValue,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double innerHeight = constraints.maxHeight;
                            double innerWidth = constraints.maxWidth;
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                buildProfileBody(viewModel, innerHeight, innerWidth, context),
                                //buildSettingButton(innerHeight, innerWidth),
                                buildCircleAvatar(innerWidth, innerWidth),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Positioned buildProfileBody(
      ProfileViewModel viewModel, double innerHeight, double innerWidth, BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: innerHeight * 0.72,
        width: innerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: innerHeight * 0.20,
            ),
            Text(
              'Mehmet Yıldırım',
              style: context.textThemeLight.headline4,
            ),
            SizedBox(
              height: innerHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      viewModel.reportText,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Nunito',
                        fontSize: 25,
                      ),
                    ),
                    Text('10', style: context.textThemeLight.headline6),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 8,
                  ),
                  child: Container(
                    height: 50,
                    width: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      viewModel.pointText,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Nunito',
                        fontSize: 25,
                      ),
                    ),
                    Text('1', style: context.textThemeLight.headline6),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Positioned buildSettingButton(double innerWidth, double innerHeight) {
    return Positioned(
      top: innerHeight * 0.35,
      right: innerWidth * 0.05,
      child: InkWell(
        onTap: () {},
        child: Icon(
          Icons.settings,
          color: Colors.grey[700],
          size: 30,
        ),
      ),
    );
  }

  Positioned buildCircleAvatar(double innerWidth, double innerHeight) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Center(
        child: CircleAvatar(
          radius: innerHeight * 0.2,
          backgroundColor: Colors.yellow,
          child: Image.asset(
            PNGImagePaths.instance.mePNG,
            width: innerWidth * 0.45,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
