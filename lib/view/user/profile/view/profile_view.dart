import 'dart:io';

import 'package:bike_path_app/core/base/view/base_view.dart';
import 'package:bike_path_app/view/user/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../_product/_constants/image_path_png.dart';
import '../../../_product/_widgets/button/general_elevated_button.dart';

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
                      Observer(builder: (_) {
                        return viewModel.isLoading == false
                            ? CircularProgressIndicator()
                            : SizedBox(
                                height: context.halfScreenVerticalValue,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    double innerHeight = constraints.maxHeight;
                                    double innerWidth = constraints.maxWidth;
                                    return Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        buildProfileBody(
                                            viewModel, innerHeight, innerWidth, context),
                                        buildSettingButton(
                                            context, viewModel, innerHeight, innerWidth),
                                        buildCircleAvatar(viewModel, innerWidth, innerWidth),
                                      ],
                                    );
                                  },
                                ),
                              );
                      }),
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
              "${viewModel.userModel!.name} ${viewModel.userModel!.surname}",
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
                      "Toplam Bildiri",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Nunito',
                        fontSize: 25,
                      ),
                    ),
                    Text(viewModel.userModel!.sumNotification.toString(),
                        style: context.textThemeLight.headline6),
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
                      "Puan",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Nunito',
                        fontSize: 25,
                      ),
                    ),
                    Text(viewModel.userModel!.point.toString(),
                        style: context.textThemeLight.headline6),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Positioned buildSettingButton(
      BuildContext context, ProfileViewModel viewModel, double innerWidth, double innerHeight) {
    return Positioned(
      top: innerHeight * 0.35,
      right: innerWidth * 0.05,
      child: InkWell(
        onTap: () {
          buildImageShowDialog(context, viewModel);
        },
        child: Icon(
          Icons.camera_alt_outlined,
          color: Colors.grey[700],
          size: 30,
        ),
      ),
    );
  }

  Positioned buildCircleAvatar(ProfileViewModel viewModel, double innerWidth, double innerHeight) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Center(
        child: Observer(builder: (_) {
          return CircleAvatar(
              radius: innerHeight * 0.2,
              backgroundColor: Colors.transparent,
              child: profileImage(viewModel, innerWidth));
        }),
      ),
    );
  }
}

Widget profileImage(ProfileViewModel viewModel, double innerWidth) {
  if (viewModel.userModel!.photoUrl != "") {
    return Image.network(viewModel.userModel!.photoUrl);
  } else {
    if (viewModel.imageIsTrue == false) {
      return Image.asset(
        PNGImagePaths.instance.mePNG,
        width: innerWidth * 0.45,
        fit: BoxFit.fitWidth,
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: FileImage(
              File(viewModel.imageUrl!.path),
            ),
          ),
        ),
      );
    }
  }
}

Future<dynamic> buildImageShowDialog(BuildContext context, ProfileViewModel viewModel) {
  BuildContext? dialogContext;
  return showDialog(
    context: context,
    builder: (context) {
      dialogContext = context;
      return AlertDialog(actions: [
        Padding(
          padding: context.paddingLowVertical,
          child: GeneralElevatedButton(
              onPressed: () {
                viewModel.getImageUrl(ImageSource.camera);
                Navigator.pop(dialogContext!);
              },
              text: "Kamerayi Aç"),
        ),
        GeneralElevatedButton(
            onPressed: () {
              viewModel.getImageUrl(ImageSource.gallery);
              Navigator.pop(dialogContext!);
            },
            text: "Galeriden Yükle"),
      ]);
    },
  );
}
