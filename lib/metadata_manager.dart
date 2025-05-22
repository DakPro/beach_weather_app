import 'package:shared_preferences/shared_preferences.dart';

final String NoLocationSelectedMessage = "no location selected";

void setLocationName(location) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("location", location);
}

Future<String> getLocationName() async {
  final prefs = await SharedPreferences.getInstance();
  String? location =  prefs.getString("location");
  if(location == null) {
    setLocationName(NoLocationSelectedMessage);
    // TODO: call geolocation service instead
    return NoLocationSelectedMessage;
  }
  return location;
}
