import 'package:bike_path_app/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:geocode/geocode.dart';

part 'google_map_view_model.g.dart';

// ignore: library_private_types_in_public_api
class GoogleMapViewModel = _GoogleMapViewModelBase with _$GoogleMapViewModel;

abstract class _GoogleMapViewModelBase with Store, BaseViewModel {
  GeoCode geoCode = GeoCode();
  @observable
  double lat = 0;
  @observable
  double lng = 0;
  @observable
  bool isLoadingLocation = false;
  @observable
  Address? adress;

  @action
  void isLoadingLocationChange() {
    isLoadingLocation = !isLoadingLocation;
  }

  @override
  init() {}

  @override
  void setContext(BuildContext context) => baseContext = context;

  @action
  Future<void> getCurrentLocation() async {
    var location = await determinePosition();
    lat = location.latitude;
    lng = location.longitude;
    print("->-> $lat");
    //adress = await geoCode.reverseGeocoding(latitude: lat, longitude: lng);
    isLoadingLocationChange();
    //print("<---$adress--->");
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
