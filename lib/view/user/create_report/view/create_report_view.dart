import 'package:bike_path_app/core/components/text/locale_text.dart';
import 'package:bike_path_app/view/_product/_widgets/button/general_elevated_button.dart';
import 'package:bike_path_app/view/_product/_widgets/lottie/lottie_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/appbar/circular_appbar.dart';
import '../../../../core/components/text_field/icon_text_form_field.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../_product/_constants/lottie_path_json.dart';
import '../view_model/create_report_view_model.dart';

class CreateReportView extends StatelessWidget {
  const CreateReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CreateReportViewModel.instance,
      onModelReady: (CreateReportViewModel viewModel) {
        viewModel.init();
        viewModel.setContext(context);
      },
      onPageBuilder: (context, CreateReportViewModel viewModel) {
        return Scaffold(
          appBar: CircularAppBar(
            title: Text("Bildiri Oluşturma"),
          ),
          body: Padding(
            padding: context.paddingMedium,
            child: SingleChildScrollView(
              child: SizedBox(
                height: context.height * 0.50,
                child: Form(
                  key: viewModel.formState,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconTextFormField(
                        controller: viewModel.titleController,
                        labelText: "Başlık",
                        icon: Icons.description_rounded,
                      ),
                      IconTextFormField(
                        controller: viewModel.descriptionController,
                        labelText: "Açıklama",
                        icon: Icons.description_sharp,
                      ),
                      buildGestureDetectorLoittie(
                          context,
                          viewModel,
                          JSONLottiePaths.instance.takeLocationLottieJSON,
                          "Konum paylaşmak için tıklayınız",
                          () {}),
                      buildGestureDetectorLoittie(
                          context,
                          viewModel,
                          JSONLottiePaths.instance.uploadImageLottieJSON,
                          "Fotoğraf yükle/değiştir", () {
                        buildImageShowDialog(context, viewModel);
                        //viewModel.getImageUrl();
                      }),
                      GeneralElevatedButton(
                          onPressed: () {
                            var textFieldIsTrue = viewModel.createReport();
                            if (textFieldIsTrue) {
                              print("basarili");
                            } else {
                              print("basarisiz");
                            }
                          },
                          text: "Bildiri Oluştur"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> buildImageShowDialog(BuildContext context, CreateReportViewModel viewModel) {
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
                text: "Kamerayı Aç"),
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

  Widget buildGestureDetectorLoittie(BuildContext context, CreateReportViewModel viewModel,
      String path, String text, Function onTap) {
    return SizedBox(
      height: context.height * 0.09,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Row(
          children: [
            LottieWidget(
              path: path,
            ),
            Padding(
              padding: context.paddingLowHorizontal,
              child: LocaleText(
                text: text,
                style: context.textThemeLight.headline7,
              ),
            )
          ],
        ),
      ),
    );
  }
}
