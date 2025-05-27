import 'package:beach_weather_app/metadata_manager.dart';
import 'package:beach_weather_app/location_services.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'location_services.dart';

class LocationSearchPage extends StatefulWidget {
  const LocationSearchPage({super.key});

  @override
  State<LocationSearchPage> createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  List<MapEntry<String,double>> closestBeaches = [];
  List<String> recentSearches = [];
  String query = '';
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    loadClosestBeaches();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void saveSearch(String search) async {
    if(!beachesLocation.containsKey(search)) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    MapEntry<String,double> beach = MapEntry<String,double>(search, await currentDistanceTo(beachesLocation[search]!));
    closestBeaches.remove(beach);
    closestBeaches.insert(0, beach);
    await prefs.setStringList('recent_searches', closestBeaches.map((e) => e.key).toList());
  }

  void loadClosestBeaches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var orderedBeaches = orderBeachesByDistance(await getCurrentLocation());
    setState((){closestBeaches = orderedBeaches;});
  }

  void updateToCurrentLocation() async {
    try {
      final currentLocation = await getCurrentLocation();
      final String? nearestBeach = findNearestBeach(
        currentLocation.latitude,
        currentLocation.longitude,
        beachesLocation, // Pass your beaches map here
      );

      if (nearestBeach != null) {
        _controller.text = nearestBeach;
        _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length));
        FocusScope.of(context).unfocus(); // Dismiss keyboard
        saveSearch(nearestBeach);
        Navigator.pop(context, nearestBeach); // Navigate back with the selected beach
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No nearby beaches found.')),
        );
      }
        } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error getting location: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Location'),
        backgroundColor: Color(0xFF7DADB2),
      ),
      body: Container (
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_1_v2.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
            children: <Widget>[
              Expanded(
                child:TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter a location',
                    filled: true,
                    fillColor: Color(0xFFDBC074),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide( color: Color(0xFFB59D59)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFB59D59)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFB59D59), width: 2),
                    ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(onPressed: updateToCurrentLocation, icon: Icon(Icons.my_location)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      query = value;
                    });
                  },
                ),
              ),
            ],
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFB7DFDF).withValues(alpha: 0.70),
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                maxHeight: min(closestBeaches.length * 60.0, MediaQuery.of(context).size.height * 0.70),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: closestBeaches.length,
                separatorBuilder: (context, index) => Divider(height: 5, color: Color(0xFF3F8D8D)),
                itemBuilder: (context, index) {
                  final text = closestBeaches[index].key;
                  final distance = '${(closestBeaches[index].value / 1000).toStringAsFixed(2)} km';
                  return
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(text), Text(distance)],
                      ),
                      onTap: () {
                        // _controller.text = text;
                        // _controller.selection = TextSelection.fromPosition(
                        //     TextPosition(offset: _controller.text.length));
                        // setState(() {
                        //   query = text;
                        //   suggestions = [];
                        // });
                        FocusScope.of(context).unfocus();
                        saveSearch(text);
                        Navigator.pop(context, text);
                      },
                    );
                },
              ),
            ),
          ]
        ),
      ),
    );
  }
}