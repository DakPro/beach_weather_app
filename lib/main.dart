import 'package:beach_weather_app/metadata_manager.dart';
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

class WeatherDataStored {
  static final WeatherDataStored _instance = WeatherDataStored._internal();
  factory WeatherDataStored() { return _instance; }
  WeatherDataStored._internal();
  Map? AQI = {currentDate:30};
  Map? temp = {currentDate:40};
  Map? atemp = {currentDate:14};
  Map? pres = {currentDate:1024};
  Map? prec = {currentDate:11};
  Map? precp = {currentDate:60};
  Map? cc = {currentDate:40};
  Map? vis = {currentDate:10};
  Map? windS = {currentDate:10};
  List? sunrise = [currentDate];
  List? sunset = [currentDate];
  DateTime? current = currentDate;
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

final DateTime currentDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

class _HomePageState extends State<HomePage> {
  OpenMeteo? openMeteo;
  List<CurrentWeatherInfo>? weatherData;
  String current = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toString();
  List<CurrentWeatherInfo> tempWeatherData = [
    CurrentWeatherInfo(pageBuilder: () => WavesPage(waves: '0.8'), label: 'Waves', icon: Icons.tsunami, value: '0.8 m'),
    CurrentWeatherInfo(pageBuilder: () => PrecipitationPage(prec: {currentDate:11}, precp: {currentDate:60}, current: currentDate), label: 'Precipitation', icon: Icons.water_drop, value: '20%'),
    CurrentWeatherInfo(pageBuilder: () => WindSpeedPage(speed: {currentDate:10}, current: currentDate), label: 'Wind Speed', icon: Icons.air, value: '6 km/h'),
    CurrentWeatherInfo(pageBuilder: () => TidePage(tide: 'low'), label: 'Tide', icon: Icons.waves, value: 'low'),
    CurrentWeatherInfo(pageBuilder: () => VisibilityPage(vis: {currentDate:10}, current: currentDate), label: 'Visibility', icon: Icons.remove_red_eye, value: '10 km'),
    CurrentWeatherInfo(pageBuilder: () => PressurePage(pressure: {currentDate:1024}, current: currentDate), label: 'Pressure', icon: Icons.compress, value: '1024 hPa'),
    CurrentWeatherInfo(pageBuilder: () => AQIPage(index: {currentDate:30}, current: currentDate), label: 'AQI', icon: Icons.speed, value: '35'),
    CurrentWeatherInfo(pageBuilder: () => SunsetPage(time: [currentDate]), label: 'Sunset', icon: Icons.wb_twilight, value: '19:26'),
    CurrentWeatherInfo(pageBuilder: () => SunrisePage(time: [currentDate]), label: 'Sunrise', icon: Icons.nights_stay, value: '05:47'),
    CurrentWeatherInfo(pageBuilder: () => CloudCoveragePage(coverage: {currentDate:40}, current: currentDate), label: 'Cloud Cover', icon: Icons.cloud, value: '40%'),
    CurrentWeatherInfo(pageBuilder: () => TemperaturePage(temp: {currentDate:18}, atemp: {currentDate:14}, current: currentDate), label: 'Temperature', icon: Icons.thermostat, value: '16°C'),
    CurrentWeatherInfo(pageBuilder: () => UVPage(uv: '2'), label: 'UV Index', icon: Icons.sunny, value: '2'),
  ];

  @override
  void initState() {
    super.initState();
    weatherData = tempWeatherData;
    loadWeatherData();
    _loadOrder();
  }

  Future<void> loadWeatherData() async {
    double lat = 52.12, lon = 0.07; // Cambridge coordinates
    OpenMeteo data = await initOpenMeteo(lon, lat);
    openMeteo = data;

    Future<Map<DateTime, num>> waitForAQIData() async {
      while (openMeteo == null || openMeteo!.getAQI().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getAQI();
    }

    Future<Map<DateTime, num>> waitForTData() async {
      while (openMeteo == null || openMeteo!.getTemperature().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getTemperature();
    }

    Future<Map<DateTime, num>> waitForATData() async {
      while (openMeteo == null || openMeteo!.getApparentTemperature().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getApparentTemperature();
    }

    Future<Map<DateTime, num>> waitForPressureData() async {
      while (openMeteo == null || openMeteo!.getPressure().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getPressure();
    }

    Future<Map<DateTime, num>> waitForPrecData() async {
      while (openMeteo == null || openMeteo!.getPrecipitation().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getPrecipitation();
    }

    Future<Map<DateTime, num>> waitForPProbData() async {
      while (openMeteo == null || openMeteo!.getPrecipitationProbability().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getPrecipitationProbability();
    }

    Future<Map<DateTime, num>> waitForWSData() async {
      while (openMeteo == null || openMeteo!.getWindSpeed().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getWindSpeed();
    }

    Future<Map<DateTime, num>> waitForVisData() async {
      while (openMeteo == null || openMeteo!.getVisibility().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getVisibility();
    }

    Future<Map<DateTime, num>> waitForCCData() async {
      while (openMeteo == null || openMeteo!.getCloudCover().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getCloudCover();
    }

    Future<List<DateTime>> waitForSunsetData() async {
      while (openMeteo == null || openMeteo!.getSunset().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getSunset();
    }

    Future<List<DateTime>> waitForSunriseData() async {
      while (openMeteo == null || openMeteo!.getSunrise().isEmpty) {
        await Future.delayed(Duration(milliseconds: 200));
      }
      return openMeteo!.getSunrise();
    }

    Map AQIdata = await waitForAQIData(), tData = await waitForTData(), apparentTData = await waitForATData(), pressureData = await waitForPressureData(), precipitationData = await waitForPrecData(), pProbData = await waitForPProbData(), ccData = await waitForCCData(), visData = await waitForVisData(), windSpeedData = await waitForWSData();
    List sunriseData = await waitForSunriseData(), sunsetData = await waitForSunsetData();
    DateTime current = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour);
    WeatherDataStored().AQI = AQIdata;
    WeatherDataStored().temp = tData;
    WeatherDataStored().atemp = apparentTData;
    WeatherDataStored().pres = pressureData;
    WeatherDataStored().prec = precipitationData;
    WeatherDataStored().precp = pProbData;
    WeatherDataStored().cc = ccData;
    WeatherDataStored().vis = visData;
    WeatherDataStored().windS = windSpeedData;
    WeatherDataStored().sunrise = sunriseData;
    WeatherDataStored().sunset = sunsetData;
    WeatherDataStored().current = current;

    List<CurrentWeatherInfo> loadedWeatherData = [
      CurrentWeatherInfo(pageBuilder: () => WavesPage(waves: '0.8'), label: 'Waves', icon: Icons.tsunami, value: '0.8 m'),
      CurrentWeatherInfo(pageBuilder: () => PrecipitationPage(prec: precipitationData, precp: pProbData, current: current), label: 'Precipitation', icon: Icons.water_drop, value: '${pProbData[current].round()}%'),
      CurrentWeatherInfo(pageBuilder: () => WindSpeedPage(speed: windSpeedData, current: current), label: 'Wind Speed', icon: Icons.air, value: '${windSpeedData[current].round()} km/h'),
      CurrentWeatherInfo(pageBuilder: () => TidePage(tide: 'low'), label: 'Tide', icon: Icons.waves, value: 'low'),
      CurrentWeatherInfo(pageBuilder: () => VisibilityPage(vis: visData, current: current), label: 'Visibility', icon: Icons.remove_red_eye, value: '${(visData[current] / 1000).round()} km'),
      CurrentWeatherInfo(pageBuilder: () => PressurePage(pressure: pressureData, current: current), label: 'Pressure', icon: Icons.compress, value: '${pressureData[current].round()} hPa'),
      CurrentWeatherInfo(pageBuilder: () => AQIPage(index: AQIdata, current: current), label: 'AQI', icon: Icons.speed, value: '${AQIdata[current].round()}'),
      CurrentWeatherInfo(pageBuilder: () => SunsetPage(time: sunsetData), label: 'Sunset', icon: Icons.wb_twilight, value: '${sunsetData[0].hour.toString().padLeft(2, '0')}:${sunsetData[0].minute.toString().padLeft(2, '0')}'),
      CurrentWeatherInfo(pageBuilder: () => SunrisePage(time: sunriseData), label: 'Sunrise', icon: Icons.nights_stay, value: '${sunriseData[0].hour.toString().padLeft(2, '0')}:${sunriseData[0].minute.toString().padLeft(2, '0')}'),
      CurrentWeatherInfo(pageBuilder: () => CloudCoveragePage(coverage: ccData, current: current), label: 'Cloud Cover', icon: Icons.cloud, value: '${ccData[current].round()}%'),
      CurrentWeatherInfo(pageBuilder: () => TemperaturePage(temp: tData, atemp: apparentTData, current: current), label: 'Temperature', icon: Icons.thermostat, value: '${tData[current].round()}°C'),
      CurrentWeatherInfo(pageBuilder: () => UVPage(uv: '2'), label: 'UV Index', icon: Icons.sunny, value: '2'),
    ];

    setState(() {
      weatherData = loadedWeatherData;
    });
  }

  List<Widget> get infoGrid => List.generate(
    weatherData!.length,
        (index) {
      final info = weatherData![index];
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
      final item = weatherData!.removeAt(oldIndex);
      weatherData!.insert(newIndex, item);
    });
    _saveOrder(); // Save after every reorder
  }

  Future<void> _saveOrder() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> order = weatherData!.map((item) => item.label).toList();
    await prefs.setStringList('weather_order', order);
  }

  Future<void> _loadOrder() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedOrder = prefs.getStringList('weather_order');

    if (savedOrder != null) {
      // Reorder weatherData based on saved labels
      Map<String, CurrentWeatherInfo> dataMap = {
        for (var item in weatherData!) item.label: item,
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
                              child: Text('${WeatherDataStored().temp![WeatherDataStored().current].round()}°C', style: const TextStyle(fontSize: 50)),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Text("UV", style: const TextStyle(fontSize: 18)),
                                      Text("2", style: const TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Icon(Icons.cloudy_snowing),
                                      Text("${WeatherDataStored().prec![WeatherDataStored().current].round()} mm", style: const TextStyle(fontSize: 18)),
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
                        image: DecorationImage(
                          image: AssetImage('assets/sun_drawing.png'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Color(0xFFD1C37E)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
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