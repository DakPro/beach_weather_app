import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.medium,
  distanceFilter: 1500
);

class LatLong {
  final double latitude;
  final double longitude;
  LatLong(this.longitude, this.latitude);
}

final Map<String, LatLong> beaches = {
  "Wells-next-the-sea beach": new LatLong(52.973617, 0.850709),
  "Southwold beach": new LatLong(52.329237,1.684303),
  "Lowestoft beach": new LatLong(52.463277,1.743465),
  "Frinton beach": new LatLong(51.829115,1.248844),
  "Aldeburgh beach": new LatLong(52.151031,1.602664),
  "Holkham beach": new LatLong(52.974779,0.801903),
  "Dunwich beach": new LatLong(52.278803,1.633669),
  "Brancaster beach": new LatLong(52.97427,0.636343),
  "Walberswick beach": new LatLong( 52.31379,1.670317),
  "Bournemouth beach": new LatLong(50.719033,-1.85118),
  "Brighton beach": new LatLong(50.819257,-0.136447),
  "Bognor Regis beach": new LatLong(50.782011,-0.671951),
  "Skegness beach": new LatLong(53.142243,0.348072),
  "Weymouth beach": new LatLong (50.610309,-2.452422),
  "Fistral beach": new LatLong( 50.416458,-5.100202 ),
  "Perranporth beach": new LatLong(50.348994,-5.156895),
  "Scarborough beach": new LatLong( 54.279648,-0.397193 ),
  "Whitby beach": new LatLong(54.491108,-0.61615),
  "Kynance Cove": new LatLong(49.97466,-5.231462),
  "Sennen Cove": new LatLong(50.075581,-5.702987),
  "Chesil beach": new LatLong(50.62667,-2.560547)
};

Future<double> getDistanceToLocation(LatLong pos) async =>
  getLocationPosition().then((value) =>
    Geolocator.distanceBetween(value.latitude, value.longitude, pos.latitude, pos.longitude))
      .catchError((e) => e);


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
    if (place.street != null && place.street!.isNotEmpty){
      if (name.isNotEmpty) name += ", ";
      name += "${place.street}";
    }
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