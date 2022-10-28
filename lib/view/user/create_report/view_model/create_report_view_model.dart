import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'create_report_view_model.g.dart';

// ignore: library_private_types_in_public_api
class CreateReportViewModel = _CreateReportViewModelBase with _$CreateReportViewModel;

abstract class _CreateReportViewModelBase with Store, BaseViewModel {
  late TextEditingController titleController;
  late TextEditingController subtitleController;

  @override
  void init() {
    titleController = TextEditingController();
    subtitleController = TextEditingController();
  }

  @override
  void setContext(BuildContext context) => baseContext = context;
}
