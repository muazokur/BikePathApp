// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GoogleMapViewModel on _GoogleMapViewModelBase, Store {
  late final _$latAtom =
      Atom(name: '_GoogleMapViewModelBase.lat', context: context);

  @override
  double get lat {
    _$latAtom.reportRead();
    return super.lat;
  }

  @override
  set lat(double value) {
    _$latAtom.reportWrite(value, super.lat, () {
      super.lat = value;
    });
  }

  late final _$lngAtom =
      Atom(name: '_GoogleMapViewModelBase.lng', context: context);

  @override
  double get lng {
    _$lngAtom.reportRead();
    return super.lng;
  }

  @override
  set lng(double value) {
    _$lngAtom.reportWrite(value, super.lng, () {
      super.lng = value;
    });
  }

  late final _$isLoadingLocationAtom =
      Atom(name: '_GoogleMapViewModelBase.isLoadingLocation', context: context);

  @override
  bool get isLoadingLocation {
    _$isLoadingLocationAtom.reportRead();
    return super.isLoadingLocation;
  }

  @override
  set isLoadingLocation(bool value) {
    _$isLoadingLocationAtom.reportWrite(value, super.isLoadingLocation, () {
      super.isLoadingLocation = value;
    });
  }

  late final _$adressAtom =
      Atom(name: '_GoogleMapViewModelBase.adress', context: context);

  @override
  Address? get adress {
    _$adressAtom.reportRead();
    return super.adress;
  }

  @override
  set adress(Address? value) {
    _$adressAtom.reportWrite(value, super.adress, () {
      super.adress = value;
    });
  }

  late final _$getCurrentLocationAsyncAction = AsyncAction(
      '_GoogleMapViewModelBase.getCurrentLocation',
      context: context);

  @override
  Future<void> getCurrentLocation() {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation());
  }

  late final _$_GoogleMapViewModelBaseActionController =
      ActionController(name: '_GoogleMapViewModelBase', context: context);

  @override
  void isLoadingLocationChange() {
    final _$actionInfo = _$_GoogleMapViewModelBaseActionController.startAction(
        name: '_GoogleMapViewModelBase.isLoadingLocationChange');
    try {
      return super.isLoadingLocationChange();
    } finally {
      _$_GoogleMapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lat: ${lat},
lng: ${lng},
isLoadingLocation: ${isLoadingLocation},
adress: ${adress}
    ''';
  }
}
