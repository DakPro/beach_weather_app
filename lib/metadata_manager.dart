import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'location_services.dart' show getPositionName, getCurrentLocation;

final String NoLocationSelectedMessage = "no location selected";
final locationPreference = "location";

void setLocationName(location) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(locationPreference, location);
}

Future<String> getLocationName() async {
  final prefs = await SharedPreferences.getInstance();
  String? location =  prefs.getString("location");
  if(location == null) {
    return await updateToCurrentLocation();
  }
  return location;
}

Future<String> updateToCurrentLocation() async {
  final prefs = await SharedPreferences.getInstance();
  String positionName = await getPositionName(await getCurrentLocation());
  prefs.setString(locationPreference, positionName);
  return positionName;
}
