// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInViewModel on SignInViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'SignInViewModelBase.isLoading', context: context);

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

  late final _$isLockOpenAtom =
      Atom(name: 'SignInViewModelBase.isLockOpen', context: context);

  @override
  bool get isLockOpen {
    _$isLockOpenAtom.reportRead();
    return super.isLockOpen;
  }

  @override
  set isLockOpen(bool value) {
    _$isLockOpenAtom.reportWrite(value, super.isLockOpen, () {
      super.isLockOpen = value;
    });
  }

  late final _$SignInViewModelBaseActionController =
      ActionController(name: 'SignInViewModelBase', context: context);

  @override
  void isLockStateChange() {
    final _$actionInfo = _$SignInViewModelBaseActionController.startAction(
        name: 'SignInViewModelBase.isLockStateChange');
    try {
      return super.isLockStateChange();
    } finally {
      _$SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingChange() {
    final _$actionInfo = _$SignInViewModelBaseActionController.startAction(
        name: 'SignInViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool fetchSingInService() {
    final _$actionInfo = _$SignInViewModelBaseActionController.startAction(
        name: 'SignInViewModelBase.fetchSingInService');
    try {
      return super.fetchSingInService();
    } finally {
      _$SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLockOpen: ${isLockOpen}
    ''';
  }
}
