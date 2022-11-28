// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  late final _$imageUrlAtom =
      Atom(name: '_ProfileViewModelBase.imageUrl', context: context);

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
      Atom(name: '_ProfileViewModelBase.imageIsTrue', context: context);

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
      AsyncAction('_ProfileViewModelBase.getImageUrl', context: context);

  @override
  Future<void> getImageUrl(ImageSource source) {
    return _$getImageUrlAsyncAction.run(() => super.getImageUrl(source));
  }

  @override
  String toString() {
    return '''
imageUrl: ${imageUrl},
imageIsTrue: ${imageIsTrue}
    ''';
  }
}
