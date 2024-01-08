import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MyGeoLocation {
  String? cityName;
  double? latitude;
  double? longitude;

  // get the current geo location info from user device
  Future<void> getCurrentLocation() async {
    bool isServiceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      debugPrint("Location services are disabled.");
    }

    // Check if location permissions are granted
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      debugPrint("Location permissions are permanently denied.");
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        debugPrint(
            "Location permissions are denied (actual value: $permission).");
      }
    }

    // Get the current latitude, longitude
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      latitude = position.latitude;
      longitude = position.longitude;
    }).catchError((e) {
      debugPrint(e);
    });

    // Get the city name
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude!, longitude!);
    cityName = placemarks[0].locality;
  }
}
