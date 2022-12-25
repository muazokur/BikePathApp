// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReportViewModel on _ReportViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ReportViewModelBase.isLoading', context: context);

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

  late final _$titleAtom =
      Atom(name: '_ReportViewModelBase.title', context: context);

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
      Atom(name: '_ReportViewModelBase.description', context: context);

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
      Atom(name: '_ReportViewModelBase.imageUrl', context: context);

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

  late final _$reportListAtom =
      Atom(name: '_ReportViewModelBase.reportList', context: context);

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

  late final _$isLoadingCommentAtom =
      Atom(name: '_ReportViewModelBase.isLoadingComment', context: context);

  @override
  bool get isLoadingComment {
    _$isLoadingCommentAtom.reportRead();
    return super.isLoadingComment;
  }

  @override
  set isLoadingComment(bool value) {
    _$isLoadingCommentAtom.reportWrite(value, super.isLoadingComment, () {
      super.isLoadingComment = value;
    });
  }

  late final _$commentListAtom =
      Atom(name: '_ReportViewModelBase.commentList', context: context);

  @override
  List<CommentId>? get commentList {
    _$commentListAtom.reportRead();
    return super.commentList;
  }

  @override
  set commentList(List<CommentId>? value) {
    _$commentListAtom.reportWrite(value, super.commentList, () {
      super.commentList = value;
    });
  }

  late final _$getReportAsyncAction =
      AsyncAction('_ReportViewModelBase.getReport', context: context);

  @override
  Future<dynamic> getReport() {
    return _$getReportAsyncAction.run(() => super.getReport());
  }

  late final _$getReportCommentsAsyncAction =
      AsyncAction('_ReportViewModelBase.getReportComments', context: context);

  @override
  Future<dynamic> getReportComments(String reportId) {
    return _$getReportCommentsAsyncAction
        .run(() => super.getReportComments(reportId));
  }

  late final _$_ReportViewModelBaseActionController =
      ActionController(name: '_ReportViewModelBase', context: context);

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_ReportViewModelBaseActionController.startAction(
        name: '_ReportViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_ReportViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingCommentChange() {
    final _$actionInfo = _$_ReportViewModelBaseActionController.startAction(
        name: '_ReportViewModelBase.isLoadingCommentChange');
    try {
      return super.isLoadingCommentChange();
    } finally {
      _$_ReportViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
title: ${title},
description: ${description},
imageUrl: ${imageUrl},
reportList: ${reportList},
isLoadingComment: ${isLoadingComment},
commentList: ${commentList}
    ''';
  }
}
