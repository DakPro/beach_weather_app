import 'package:beach_weather_app/metadata_manager.dart';
import 'package:beach_weather_app/stats/stats_page.dart';
import 'package:beach_weather_app/stats/graph.dart';
import 'package:beach_weather_app/weather/open_meteo.dart';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'location_search_page.dart';
import 'element_pages.dart';
import 'data_models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beach Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CurrentWeatherInfo> weatherData = [
    CurrentWeatherInfo(pageBuilder: () => WavesPage(waves: '0.8 m'), label: 'Waves', icon: Icons.tsunami, value: '0.8 m'),
    CurrentWeatherInfo(pageBuilder: () => HumidityPage(humidity: '60%'), label: 'Humidity', icon: Icons.water_drop, value: '60%'),
    CurrentWeatherInfo(pageBuilder: () => WindSpeedPage(speed: '12 km/h'), label: 'Wind Speed', icon: Icons.air, value: '12 km/h'),
    CurrentWeatherInfo(pageBuilder: () => TidePage(tide: 'low'), label: 'Tide', icon: Icons.waves, value: 'low'),
    CurrentWeatherInfo(pageBuilder: () => VisibilityPage(vis: '10 km'), label: 'Visibility', icon: Icons.remove_red_eye, value: '10 km'),
    CurrentWeatherInfo(pageBuilder: () => PressurePage(pressure: '1015 hPa'), label: 'Pressure', icon: Icons.compress, value: '1015 hPa'),
    CurrentWeatherInfo(pageBuilder: () => StatsPage(title: "AQI", description: "AQI is measured...", widgets: [Graph(loadData: initOpenMeteo(1, 1).then((x) => x.getAQI()),)]), label: 'AQI', icon: Icons.speed, value: '3'),
    CurrentWeatherInfo(pageBuilder: () => SunsetPage(time: '6:15 AM'), label: 'Sunrise', icon: Icons.wb_twilight, value: '6:15 AM'),
    CurrentWeatherInfo(pageBuilder: () => SunsetPage(time: '7:45 PM'), label: 'Sunset', icon: Icons.nights_stay, value: '7:45 PM'),
    CurrentWeatherInfo(pageBuilder: () => CloudCoveragePage(coverage: '40%'), label: 'Cloud Cover', icon: Icons.cloud, value: '40%'),
    CurrentWeatherInfo(pageBuilder: () => TemperaturePage(temp: '18°C'), label: 'Temperature', icon: Icons.thermostat, value: '18°C'),
    CurrentWeatherInfo(pageBuilder: () => UVPage(uv: '2'), label: 'UV Index', icon: Icons.sunny, value: '2'),
  ];

  List<Widget> get infoGrid => List.generate(
    weatherData.length,
        (index) {
      final info = weatherData[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => info.pageBuilder(),
          ),
          );
          },
        child: Container(
          key: ValueKey(info.label), // Use unique key
          height: 80,
          width: 175,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFEBE2B4).withValues(alpha: 0.70),
            // border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF5B5431).withValues(alpha: 0.40),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(info.icon),
              Text(
                info.label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                info.value,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      );
    },
  );

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = weatherData.removeAt(oldIndex);
      weatherData.insert(newIndex, item);
    });
    _saveOrder(); // Save after every reorder
  }

  Future<void> _saveOrder() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> order = weatherData.map((item) => item.label).toList();
    await prefs.setStringList('weather_order', order);
  }

  Future<void> _loadOrder() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedOrder = prefs.getStringList('weather_order');

    if (savedOrder != null) {
      // Reorder weatherData based on saved labels
      Map<String, CurrentWeatherInfo> dataMap = {
        for (var item in weatherData) item.label: item,
      };

      setState(() {
        weatherData = savedOrder
            .where((label) => dataMap.containsKey(label))
            .map((label) => dataMap[label]!)
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_1_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationSearchPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFD1C37E).withValues(alpha: 0.70),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 60,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: FutureBuilder<String>( // Use FutureBuilder
                            future: getLocationName(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator(); // Show loading indicator
                              } else {
                                if (snapshot.hasError) {
                                  print('Error: ${snapshot.error}');
                                }
                              return Text(
                                  snapshot.data ?? 'Unknown Location', // Display location name
                                  style: TextStyle(
                                    color: Color(0xFF5B5431),
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.search, color: Color(0xFF5B5431)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 175,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFD1C37E).withValues(alpha: 0.50),
                        border: Border.all(color: Color(0xFFD1C37E)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Text("9°C", style: const TextStyle(fontSize: 50)),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text("UV", style: const TextStyle(fontSize: 18)),
                                    Text("5", style: const TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Icon(Icons.cloudy_snowing),
                                    Text("11mm", style: const TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text("WT", style: const TextStyle(fontSize: 18)),
                                    Text("5°C", style: const TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 175,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFD1C37E).withValues(alpha: 0.50),
                        border: Border.all(color: Color(0xFFD1C37E)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: Text('Image')),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFFD1C37E).withValues(alpha: 0.70),
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF706944).withValues(alpha: 0.70),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.try_sms_star_rounded, color: Color(0xFF5B5431)),
                  ),
                  Text(
                    'Better dress up warm today!',
                    style: TextStyle(
                      color: Color(0xFF5B5431),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: CarouselView(
                itemExtent: 100,
                padding: const EdgeInsets.all(10.0),
                children: List<Widget>.generate(7, (int index) {
                  return Center(child: Text('Item $index'));
                }),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ReorderableWrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                needsLongPressDraggable: true,
                onReorder: _onReorder,
                children: infoGrid,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: containerData.map((data) {
                return InfoContainer(
                  day: data.day,
                  temperatures: data.temperatures,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  final String day;
  final List<int> temperatures;

  const InfoContainer({
    super.key,
    required this.day,
    required this.temperatures,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF74AFB8).withValues(alpha: 0.40),
        border: Border.all(color: Color(0xFF41A1BE)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: const TextStyle(fontSize: 18)),
          Text(temperatures.toString(), style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

final List<NextDaysWeatherInfo> containerData = [
  NextDaysWeatherInfo(day: 'Monday', temperatures: [1,2,3]),
  NextDaysWeatherInfo(day: 'Tuesday', temperatures: [2,3,4]),
  NextDaysWeatherInfo(day: 'Wednesday', temperatures: [3,4,5]),
  NextDaysWeatherInfo(day: 'Thursday', temperatures: [4,5,6]),
  NextDaysWeatherInfo(day: 'Friday', temperatures: [5,6,7]),
  NextDaysWeatherInfo(day: 'Saturday', temperatures: [6,7,8]),
  NextDaysWeatherInfo(day: 'Sunday', temperatures: [7,8,9]),
];