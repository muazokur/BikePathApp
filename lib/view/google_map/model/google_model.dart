class GoogleModel {
  static final GoogleModel _instance = GoogleModel._init();
  static GoogleModel get instance => _instance;
  GoogleModel._init();

  List<double> _currentLocation = [];

  addCurrentLocation(double latitude, double longitude) {
    print("----------<<$latitude");
    _currentLocation.add(latitude);
    _currentLocation.add(longitude);
  }

  List<double> getCurrentLocation() {
    if (_currentLocation.isNotEmpty) {
      return _currentLocation;
    }
    throw List.empty();
  }
}
