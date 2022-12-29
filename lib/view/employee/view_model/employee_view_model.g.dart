// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeViewModel on _EmployeeViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EmployeeViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$reportListAtom =
      Atom(name: '_EmployeeViewModelBase.reportList', context: context);

  @override
  List<ReportModel>? get reportList {
    _$reportListAtom.reportRead();
    return super.reportList;
  }

  @override
  set reportList(List<ReportModel>? value) {
    _$reportListAtom.reportWrite(value, super.reportList, () {
      super.reportList = value;
    });
  }

  late final _$_EmployeeViewModelBaseActionController =
      ActionController(name: '_EmployeeViewModelBase', context: context);

  @override
  dynamic isLoadingChange() {
    final _$actionInfo = _$_EmployeeViewModelBaseActionController.startAction(
        name: '_EmployeeViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_EmployeeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
reportList: ${reportList}
    ''';
  }
}
