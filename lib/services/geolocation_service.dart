import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationService {
  GeolocationService();

  Future<Position> getGeolocation() async {
    // get permission from user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Get the current latitude, longitude
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return position;
  }

  Future<String> getCityNameByCoords(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    return placemarks[0].locality ?? "";
  }

  // TO DO:
  // Future<void> getCoordsFromCityName(String cityName) {}
}
