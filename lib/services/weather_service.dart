import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather_app_flutter/services/geolocation_service.dart';
import 'package:my_weather_app_flutter/models/weather.dart';

class WeatherService {
  String? city;
  double? latitude;
  double? longitude;

  WeatherService({
    this.city,
    this.latitude,
    this.longitude,
  });

  Future<Weather> getWeatherData() async {
    final Position position;
    const String OPEN_METEO_BASE_URL = 'https://api.open-meteo.com/v1/forecast';

    GeolocationService geolocationService = GeolocationService();

    // get the current geolocation for the user's device
    position = await geolocationService.getGeolocation();
    latitude = position.latitude;
    longitude = position.longitude;

    // get the current city name for the user's device
    city = await geolocationService.getCityNameByCoords(
        position.latitude, position.longitude);

    // Fetch the weather data with current condition and forecast next 7 days
    final res = await http.get(Uri.parse(
        '$OPEN_METEO_BASE_URL?latitude=$latitude&longitude=$longitude&current=temperature_2m&current=weather_code&hourly=temperature_2m'));

    if (res.statusCode == 200) {
      return Weather.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to load weather data.');
    }
  }
}
