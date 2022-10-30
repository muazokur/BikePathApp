// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateReportViewModel on _CreateReportViewModelBase, Store {
  late final _$locationIsTrueAtom =
      Atom(name: '_CreateReportViewModelBase.locationIsTrue', context: context);

  @override
  bool get locationIsTrue {
    _$locationIsTrueAtom.reportRead();
    return super.locationIsTrue;
  }

  @override
  set locationIsTrue(bool value) {
    _$locationIsTrueAtom.reportWrite(value, super.locationIsTrue, () {
      super.locationIsTrue = value;
    });
  }

  late final _$titleAtom =
      Atom(name: '_CreateReportViewModelBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_CreateReportViewModelBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$imageUrlAtom =
      Atom(name: '_CreateReportViewModelBase.imageUrl', context: context);

  @override
  XFile? get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(XFile? value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$imageIsTrueAtom =
      Atom(name: '_CreateReportViewModelBase.imageIsTrue', context: context);

  @override
  bool get imageIsTrue {
    _$imageIsTrueAtom.reportRead();
    return super.imageIsTrue;
  }

  @override
  set imageIsTrue(bool value) {
    _$imageIsTrueAtom.reportWrite(value, super.imageIsTrue, () {
      super.imageIsTrue = value;
    });
  }

  late final _$getImageUrlAsyncAction =
      AsyncAction('_CreateReportViewModelBase.getImageUrl', context: context);

  @override
  Future<void> getImageUrl(ImageSource source) {
    return _$getImageUrlAsyncAction.run(() => super.getImageUrl(source));
  }

  late final _$_CreateReportViewModelBaseActionController =
      ActionController(name: '_CreateReportViewModelBase', context: context);

  @override
  void getLocation() {
    final _$actionInfo = _$_CreateReportViewModelBaseActionController
        .startAction(name: '_CreateReportViewModelBase.getLocation');
    try {
      return super.getLocation();
    } finally {
      _$_CreateReportViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool createReport() {
    final _$actionInfo = _$_CreateReportViewModelBaseActionController
        .startAction(name: '_CreateReportViewModelBase.createReport');
    try {
      return super.createReport();
    } finally {
      _$_CreateReportViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locationIsTrue: ${locationIsTrue},
title: ${title},
description: ${description},
imageUrl: ${imageUrl},
imageIsTrue: ${imageIsTrue}
    ''';
  }
}
