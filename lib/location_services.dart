import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.medium,
  distanceFilter: 1500
);

class LatLong {
  final double latitude;
  final double longitude;
  LatLong(this.latitude, this.longitude);
}

Future<double> currentDistanceTo(LatLong pos) async {
  var location = await getCurrentLocation();
  return Geolocator.distanceBetween(pos.latitude, pos.longitude,location.latitude, location.longitude);
}

final Map<String, LatLong> beachesLocation = {
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

Future<String> getPositionName(LatLong coordinates) async { // Changed parameter to LatLng
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      coordinates.latitude, coordinates.longitude,);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      String? name = place.name;
      if (name != null && name.isNotEmpty) return name;

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

      if (name.isEmpty) {
        return place.name ?? "Unknown location";
      }
      return name;
    } else {
      return "Unknown address coordinates.";
    }
  } on PlatformException catch (e) {
    if (e.code == 'ERROR_GEOCODING_COORDINATES' || e.code == 'IO_ERROR') {
      return "Geocoding service unavailable or network error. Please try again.";
    }
    return "Error getting address: ${e.message}";
  } catch (e) {
    return "An unexpected error occurred: $e";
  }
}

Future<LatLong> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Fail to request location
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, try again next time
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position position = await Geolocator.getCurrentPosition();
  return LatLong(position.latitude, position.longitude);
}

String? findNearestBeach(double currentLat, double currentLon, Map<String, LatLong> beaches) {
  if (beaches.isEmpty) {
    return null;
  }

  String? nearestBeachName;
  double minDistance = double.infinity;

  beaches.forEach((name, latLng) {
    double distance = Geolocator.distanceBetween(
      currentLat,
      currentLon,
      latLng.latitude,
      latLng.longitude,
    );

    if (distance < minDistance) {
      minDistance = distance;
      nearestBeachName = name;
    }
  });
  return nearestBeachName;
}

List<MapEntry<String, double>> orderBeachesByDistance(LatLong currentPos){
  Map<String, double> beachesDistances = {
    for (var entry in beachesLocation.entries)
      entry.key: Geolocator.distanceBetween(entry.value.latitude, entry.value.longitude,
          currentPos.latitude, currentPos.longitude)
  };
  var sortedEntries = beachesDistances.entries.toList()
    ..sort((a, b) => a.value.compareTo(b.value));
  return sortedEntries;
}
