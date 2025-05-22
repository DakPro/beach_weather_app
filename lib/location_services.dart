import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.medium,
  distanceFilter: 1500
);

// Get current device location
Future<Position> getLocationPosition() async {
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

Future<String> getPositionName(double latitude, double longitude) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(latitude,longitude);
  if (placemarks.isNotEmpty) {
    Placemark place = placemarks.first; // Get the most relevant placemark
    String? name = place.name;
    if(name!=null)return name;
    name = "";
    if (place.subLocality != null && place.subLocality!.isNotEmpty) {
      if (name.isNotEmpty) name += ", ";
      name += "${place.subLocality}";
    }
    if (place.locality != null && place.locality!.isNotEmpty) {
      if (name.isNotEmpty) name += ", ";
      name += "${place.locality}";
    }
    if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
      if (name.isNotEmpty) name += ", ";
      name += "${place.administrativeArea}";
    }
    if (place.country != null && place.country!.isNotEmpty) {
      if (name.isNotEmpty) name += ", ";
      name += "${place.country}";
    }
    // Fallback if detailed address is not available
    if (name.isEmpty) {
      return place.name ?? "Unknown location"; // Use placemark's general name field
    }
    return name;
  } else {
    return "Unknown address coordinates.";
  }
}