import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:bike_path_app/core/base/view/base_view.dart';

import '../view_model.dart/google_map_view_model.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({
    Key? key,
    this.isGetLocationButton = true,
  }) : super(key: key);

  final bool isGetLocationButton;
  @override
  Widget build(BuildContext context) {
    return BaseView<GoogleMapViewModel>(
      viewModel: GoogleMapViewModel(),
      onModelReady: (viewModel) async {
        viewModel.setContext(context);
        viewModel.getCurrentLocation();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          body: Observer(builder: (_) {
            return viewModel.isLoadingLocation == false
                ? Center(child: CircularProgressIndicator())
                : GoogleMap(
                    myLocationEnabled: false,
                    initialCameraPosition: CameraPosition(
                        bearing: 192.8334901395799,
                        target: LatLng(viewModel.lat, viewModel.lng),
                        tilt: 10.440717697143555,
                        zoom: 16.151926040649414),
                    markers: {
                      Marker(
                        markerId: MarkerId('_kGooglePlexMarker'),
                        infoWindow: InfoWindow(title: "Ben"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                        position: LatLng(viewModel.lat, viewModel.lng),
                      ),
                    },
                  );
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
          floatingActionButton: Visibility(
            visible: isGetLocationButton,
            child: FloatingActionButton.extended(
              onPressed: () async {
                // var loc = await viewModel.determinePosition();
                //print("${loc.latitude} ${loc.longitude}");
                Navigator.pop(context);
              },
              label: Text("Konum Al"),
              icon: Icon(Icons.location_history),
            ),
          ),
        );
      },
    );
  }
}
