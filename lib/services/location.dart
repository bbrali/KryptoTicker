import 'package:geolocator/geolocator.dart';

class Location {
  Map<String, double> _geographicCoordinates = {};

  Future<Map<String, double>> getGeographicCoordinates() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _geographicCoordinates['latitude'] = position.latitude;
      _geographicCoordinates['longitude'] = position.longitude;
    } catch (exception) {
      print('Sorry! We\'re unable to get your location. ERROR:$exception');
    }
    return _geographicCoordinates;
  }
}
