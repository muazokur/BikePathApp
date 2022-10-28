import 'package:bike_path_app/view/_product/_widgets/button/general_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/appbar/circular_appbar.dart';
import '../../../../core/components/text_field/icon_text_form_field.dart';
import '../../../../core/extensions/context_extension.dart';
import '../view_model/create_report_view_model.dart';

class CreateReportView extends StatelessWidget {
  const CreateReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CreateReportViewModel(),
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
            child: SizedBox(
              height: context.height * 0.30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconTextFormField(
                    controller: viewModel.titleController,
                    labelText: "Başlık",
                    icon: Icons.description_rounded,
                  ),
                  IconTextFormField(
                    controller: viewModel.titleController,
                    labelText: "Açıklama",
                    icon: Icons.description_sharp,
                  ),
                  GeneralElevatedButton(onPressed: () {}, text: "Bildiri Oluştur")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
