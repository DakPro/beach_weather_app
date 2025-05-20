import 'package:geolocator/geolocator.dart';

final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.medium,
  distanceFilter: 1500
);

// Get current device location
Future<Position> getLocationAsync() async {
  bool hasService = await Geolocator.isLocationServiceEnabled();
  // Check if location services are enabled.
  if (!hasService) {
    return Future.error("Location services disabled");
  }
  // Check if the app has location permissions.
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied this time, can request permissions next time.
      return Future.error("Location permissions denied");
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error("Location permissions are denied forever");
  }

  // Permissions are granted, return location
  return await Geolocator.getCurrentPosition();
}