class GoogleModel {
  static final GoogleModel _instance = GoogleModel._init();
  static GoogleModel get instance => _instance;
  GoogleModel._init();

  // ignore: prefer_final_fields
  List<double> _currentLocation = [];

  addCurrentLocation(double latitude, double longitude) {
    _currentLocation.clear();
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
