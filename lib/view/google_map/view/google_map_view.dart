import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({Key? key}) : super(key: key);

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      //38.0155929,32.5214485
      target: LatLng(38.01559291324, 32.521448532465),
      tilt: 10.440717697143555,
      zoom: 16.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kLake,
      ),
    );
  }
}
