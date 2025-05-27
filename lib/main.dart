import 'package:beach_weather_app/weather/open_meteo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reorderables/reorderables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'location_search_page.dart';
import 'location_services.dart';
import 'element_pages.dart';
import 'data_models.dart';

void main() {
  runApp(const MyApp());
}

class WeatherDataStored { // global singleton class for storage and retrieval of weather information
  static final WeatherDataStored _instance = WeatherDataStored._internal();
  factory WeatherDataStored() { return _instance; }
  WeatherDataStored._internal();
  Map? AQI = {currentDate:30};
  Map? temp = {currentDate:16, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22};
  Map? atemp = {currentDate:16, currentDate.add(Duration(hours: 1)):19, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):9, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):16, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22};
  Map? pres = {currentDate:1024};
  Map? prec = {currentDate:16, currentDate.add(Duration(hours: 1)):1, currentDate.add(Duration(hours: 2)):8, currentDate.add(Duration(hours: 3)):1, currentDate.add(Duration(hours: 4)):1, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):8, currentDate.add(Duration(hours: 10)):2, currentDate:6, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22};
  Map? precp = {currentDate:16, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22};
  Map? cc = {currentDate:16, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22};
  Map? vis = {currentDate:16, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22};
  Map? windS = {currentDate:16, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22};
  List? sunrise = [currentDate, currentDate.add(Duration(days: 1)), currentDate.add(Duration(days: 2)), currentDate.add(Duration(days: 3)), currentDate.add(Duration(days: 4)), currentDate.add(Duration(days: 5)),currentDate.add(Duration(days: 6))];
  List? sunset = [currentDate, currentDate.add(Duration(days: 1)), currentDate.add(Duration(days: 2)), currentDate.add(Duration(days: 3)), currentDate.add(Duration(days: 4)), currentDate.add(Duration(days: 5)),currentDate.add(Duration(days: 6))];
  List? UV = ['1','3','2','6','5','2','4'];
  List? tide = ['low', 'low', 'high', 'low', 'high', 'high', 'high'];
  List? waveHeight = ['0.3', '0.8', '0.5', '0.4', '1.2', '0.8', '0.2'];
  DateTime current = currentDate;
  DateTime selectedDay = currentDate;
  String suggestion = 'Have a nice day!';
  String photo = 'assets/sun_1.png';
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

final DateTime currentDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour);
final List<String> suggestions = ['Great time to go to the beach!', 'Consider going on another day.', 'It is too cold to swim in the sea.', 'It is too hot to stay in the sun.'];
final List<String> photos = ['assets/sun_1.png', 'assets/cloudy.png', 'assets/rain.png', 'assets/sun_2.png'];

class _HomePageState extends State<HomePage> {
  // default data to be displayed if the API can't be accessed / no other location is selected
  String _selectedLocationName = 'Cambridge';
  OpenMeteo? openMeteo;
  List<CurrentWeatherInfo>? weatherData;
  String current = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toString();
  List<CurrentWeatherInfo> tempWeatherData = [
    CurrentWeatherInfo(pageBuilder: () => WavesPage(waves: '0.8'), label: 'Waves', icon: Icons.tsunami, value: '0.8 m'),
    CurrentWeatherInfo(pageBuilder: () => PrecipitationPage(prec: {currentDate:16, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22}, precp: {currentDate:20, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22}, current: currentDate), label: 'Precipitation', icon: Icons.water_drop, value: '20%'),
    CurrentWeatherInfo(pageBuilder: () => WindSpeedPage(speed: {currentDate:6, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22}, current: currentDate), label: 'Wind Speed', icon: Icons.air, value: '6 km/h'),
    CurrentWeatherInfo(pageBuilder: () => TidePage(tide: 'low'), label: 'Tide', icon: Icons.waves, value: 'low'),
    CurrentWeatherInfo(pageBuilder: () => VisibilityPage(vis: {currentDate:10, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22}, current: currentDate), label: 'Visibility', icon: Icons.remove_red_eye, value: '10 km'),
    CurrentWeatherInfo(pageBuilder: () => PressurePage(pressure: {currentDate:1024}, current: currentDate), label: 'Pressure', icon: Icons.compress, value: '1024 hPa'),
    CurrentWeatherInfo(pageBuilder: () => AQIPage(index: {currentDate:35}, current: currentDate), label: 'AQI', icon: Icons.speed, value: '35'),
    CurrentWeatherInfo(pageBuilder: () => SunsetPage(time: [currentDate, currentDate.add(Duration(days: 1)), currentDate.add(Duration(days: 2)), currentDate.add(Duration(days: 3)), currentDate.add(Duration(days: 4)), currentDate.add(Duration(days: 5)),currentDate.add(Duration(days: 6))]), label: 'Sunset', icon: Icons.wb_twilight, value: '19:26'),
    CurrentWeatherInfo(pageBuilder: () => SunrisePage(time: [currentDate, currentDate.add(Duration(days: 1)), currentDate.add(Duration(days: 2)), currentDate.add(Duration(days: 3)), currentDate.add(Duration(days: 4)), currentDate.add(Duration(days: 5)),currentDate.add(Duration(days: 6))]), label: 'Sunrise', icon: Icons.nights_stay, value: '05:47'),
    CurrentWeatherInfo(pageBuilder: () => CloudCoveragePage(coverage: {currentDate:40, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22}, current: currentDate), label: 'Cloud Cover', icon: Icons.cloud, value: '40%'),
    CurrentWeatherInfo(pageBuilder: () => TemperaturePage(temp: {currentDate:16, currentDate.add(Duration(hours: 1)):31, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):19, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):22, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22}, atemp: {currentDate:16, currentDate.add(Duration(hours: 1)):19, currentDate.add(Duration(hours: 2)):28, currentDate.add(Duration(hours: 3)):9, currentDate.add(Duration(hours: 4)):18, currentDate.add(Duration(hours: 5)):16, currentDate.add(Duration(hours: 6)):11, currentDate.add(Duration(hours: 7)):8, currentDate.add(Duration(hours: 8)):9, currentDate.add(Duration(hours: 9)):18, currentDate.add(Duration(hours: 10)):22, currentDate:16, currentDate.add(Duration(hours: 11)):31, currentDate.add(Duration(hours: 12)):28, currentDate.add(Duration(hours: 13)):19, currentDate.add(Duration(hours: 14)):18, currentDate.add(Duration(hours: 15)):22, currentDate.add(Duration(hours: 16)):11, currentDate.add(Duration(hours: 17)):8, currentDate.add(Duration(hours: 18)):9, currentDate.add(Duration(hours: 19)):18, currentDate.add(Duration(hours: 20)):22, currentDate.add(Duration(hours: 21)):20, currentDate.add(Duration(hours: 22)):19, currentDate.add(Duration(hours: 23)):18, currentDate.add(Duration(hours: 24)):22}, current: currentDate), label: 'Temperature', icon: Icons.thermostat, value: '16°C'),
    CurrentWeatherInfo(pageBuilder: () => UVPage(uv: '2'), label: 'UV Index', icon: Icons.sunny, value: '2'),
  ];

  @override
  void initState() {
    super.initState();
    weatherData = tempWeatherData;
    loadWeatherData(52.12, 0.07); // Cambridge coordinates for the default location
    _loadOrder();
    _generateDayLabels();
    loadInitialLocation();
  }

  Future<void> loadWeatherData(double lat, double lon) async {
    // attempt to access the weather API and update weather information whenever the user
    // wants to see information for a new location or different day
    OpenMeteo data = await initOpenMeteo(lon, lat);
    openMeteo = data;

    // functions for fetching data from the API (returning maps for each weather condition when those become available)
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

    // add the current correct weather data to the single instance storage class
    Map AQIdata = await waitForAQIData(), tData = await waitForTData(), apparentTData = await waitForATData(), pressureData = await waitForPressureData(), precipitationData = await waitForPrecData(), pProbData = await waitForPProbData(), ccData = await waitForCCData(), visData = await waitForVisData(), windSpeedData = await waitForWSData();
    List sunriseData = await waitForSunriseData(), sunsetData = await waitForSunsetData();
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

    // conditional statements to choose which suggestion and image to display on the main page
    if(WeatherDataStored().temp![WeatherDataStored().current] < 15) {
      WeatherDataStored().suggestion = suggestions[2];
      if(WeatherDataStored().prec![WeatherDataStored().current] > 5) {
        WeatherDataStored().photo = photos[2];
      } else {
        WeatherDataStored().photo = photos[1];
      }
    } else if(WeatherDataStored().temp![WeatherDataStored().current] >= 15 && WeatherDataStored().temp![WeatherDataStored().current] < 25) {
      WeatherDataStored().suggestion = suggestions[1];
      WeatherDataStored().photo = photos[1];
    } else if(WeatherDataStored().temp![WeatherDataStored().current] >= 25 && WeatherDataStored().temp![WeatherDataStored().current] < 35) {
      WeatherDataStored().suggestion = suggestions[0];
      WeatherDataStored().photo = photos[0];
    } else {
      WeatherDataStored().suggestion = suggestions[3];
      WeatherDataStored().photo = photos[3];
    }

    // update values displayed on the main page's grid and pass the correct maps to the element pages
    List<CurrentWeatherInfo> loadedWeatherData = [
      CurrentWeatherInfo(pageBuilder: () => WavesPage(waves: WeatherDataStored().waveHeight?[0]), label: 'Waves', icon: Icons.tsunami, value: '${WeatherDataStored().waveHeight?[WeatherDataStored().selectedDay.difference(WeatherDataStored().current).inDays]} m'),
      CurrentWeatherInfo(pageBuilder: () => PrecipitationPage(prec: precipitationData, precp: pProbData, current: WeatherDataStored().current), label: 'Precipitation', icon: Icons.water_drop, value: '${pProbData[WeatherDataStored().selectedDay].round()}%'),
      CurrentWeatherInfo(pageBuilder: () => WindSpeedPage(speed: windSpeedData, current: WeatherDataStored().current), label: 'Wind Speed', icon: Icons.air, value: '${windSpeedData[WeatherDataStored().selectedDay].round()} km/h'),
      CurrentWeatherInfo(pageBuilder: () => TidePage(tide: WeatherDataStored().tide?[0]), label: 'Tide', icon: Icons.waves, value: '${WeatherDataStored().tide?[WeatherDataStored().selectedDay.difference(WeatherDataStored().current).inDays]}'),
      CurrentWeatherInfo(pageBuilder: () => VisibilityPage(vis: visData, current: WeatherDataStored().current), label: 'Visibility', icon: Icons.remove_red_eye, value: '${(visData[WeatherDataStored().selectedDay] / 1000).round()} km'),
      CurrentWeatherInfo(pageBuilder: () => PressurePage(pressure: pressureData, current: WeatherDataStored().current), label: 'Pressure', icon: Icons.compress, value: '${pressureData[WeatherDataStored().selectedDay].round()} hPa'),
      CurrentWeatherInfo(pageBuilder: () => AQIPage(index: AQIdata, current: WeatherDataStored().current), label: 'AQI', icon: Icons.speed, value: '${AQIdata[WeatherDataStored().selectedDay].round()}'),
      CurrentWeatherInfo(pageBuilder: () => SunsetPage(time: sunsetData), label: 'Sunset', icon: Icons.wb_twilight, value: '${sunsetData[((WeatherDataStored().selectedDay).difference(WeatherDataStored().current)).inDays].hour.toString().padLeft(2, '0')}:${sunsetData[((WeatherDataStored().selectedDay).difference(WeatherDataStored().current)).inDays].minute.toString().padLeft(2, '0')}'),
      CurrentWeatherInfo(pageBuilder: () => SunrisePage(time: sunriseData), label: 'Sunrise', icon: Icons.nights_stay, value: '${sunriseData[((WeatherDataStored().selectedDay).difference(WeatherDataStored().current)).inDays].hour.toString().padLeft(2, '0')}:${sunriseData[((WeatherDataStored().selectedDay).difference(WeatherDataStored().current)).inDays].minute.toString().padLeft(2, '0')}'),
      CurrentWeatherInfo(pageBuilder: () => CloudCoveragePage(coverage: ccData, current: WeatherDataStored().current), label: 'Cloud Cover', icon: Icons.cloud, value: '${ccData[WeatherDataStored().selectedDay].round()}%'),
      CurrentWeatherInfo(pageBuilder: () => TemperaturePage(temp: tData, atemp: apparentTData, current: WeatherDataStored().current), label: 'Temperature', icon: Icons.thermostat, value: '${tData[WeatherDataStored().selectedDay].round()}°C'),
      CurrentWeatherInfo(pageBuilder: () => UVPage(uv: WeatherDataStored().UV?[0]), label: 'UV Index', icon: Icons.sunny, value: '${WeatherDataStored().UV?[WeatherDataStored().selectedDay.difference(WeatherDataStored().current).inDays]}'),
    ];

    setState(() {
      weatherData = loadedWeatherData;
    });
  }

  // grid for displaying each weather condition for some selected day
  List<Widget> get infoGrid => List.generate(
    weatherData!.length,
        (index) {
      final info = weatherData![index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => info.pageBuilder(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const start = Offset(0.0, 1.0);
                const finish = Offset.zero;
                final t = Tween(begin: start, end: finish).chain(CurveTween(curve: Curves.ease));
                final offsetAnimation = animation.drive(t);
                return SlideTransition(position: offsetAnimation, child: child);
              }
            ),
          );
        },
        child: Container(
          key: ValueKey(info.label), // use unique key
          height: 80,
          width: 160,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFB7DFDF).withValues(alpha: 0.70),
            // border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF4E8082).withValues(alpha: 0.40),
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
    _saveOrder();
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

  int selectedDayIndex = 0;
  List<String> dayLabels = [];

  void _generateDayLabels() {
    final now = DateTime.now();
    dayLabels = List.generate(7, (index) {
      if (index == 0) return 'Today';
      final date = now.add(Duration(days: index));
      return DateFormat('E').format(date);
    });
  }

  Future<void> loadInitialLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocation = prefs.getString('locationName');
    if (savedLocation != null) {
      setState(() {
        _selectedLocationName = savedLocation;
      });
    }
  }

  Future<void> updateLocation(String newLocation) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locationName', newLocation);
    setState(() {
      _selectedLocationName = newLocation;
    });
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
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    final selectedLocation = await Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => LocationSearchPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const start = Offset(0.0, 1.0);
                          const finish = Offset.zero;
                          final t = Tween(begin: start, end: finish).chain(CurveTween(curve: Curves.ease));
                          final offsetAnimation = animation.drive(t);
                          return SlideTransition(position: offsetAnimation, child: child);
                        },
                      ),
                    );
                    if (selectedLocation != null && selectedLocation is String) {
                      LatLong? selectedLocationCoordinates = beachesLocation[selectedLocation];
                      updateLocation(selectedLocation);
                      loadWeatherData(selectedLocationCoordinates!.latitude, selectedLocationCoordinates.longitude);
                    }
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
                          child: Text(
                            _selectedLocationName,
                            style: const TextStyle(
                              color: Color(0xFF5B5431),
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.search, color: Color(0xFF5B5431)),
                        ),
                      ],
                    ),
                  ),
                  // search bar displaying location and used to access a separate location search page
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
                            Text('${WeatherDataStored().temp![WeatherDataStored().current].round()}°C', style: const TextStyle(fontSize: 50)),
                            SizedBox(
                              height: 20, // example height, adjust as needed
                              child: Divider(
                                color: Color(0xFF8C824D),
                                thickness: 1,
                                height: 20,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Text("UV", style: const TextStyle(fontSize: 18)),
                                      Text('${WeatherDataStored().UV?[0]}', style: const TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60, // example height, adjust as needed
                                  child: VerticalDivider(
                                    color: Color(0xFF8C824D),
                                    thickness: 1,
                                    width: 10,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Icon(Icons.cloudy_snowing),
                                      Text("${WeatherDataStored().prec![WeatherDataStored().current].round()}", style: const TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60, // example height, adjust as needed
                                  child: VerticalDivider(
                                    color: Color(0xFF8C824D),
                                    thickness: 1,
                                    width: 10,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Text("WT", style: const TextStyle(fontSize: 18)),
                                      Text("9°C", style: const TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                    ),
                    // box for displaying the most relevant weather information at the current moment
                    // for the user (temperature, UV, water temperature and precipitations)
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 175,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(WeatherDataStored().photo), // displays the appropriate photo based on current weather conditions
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
                    WeatherDataStored().suggestion, // suggestion box displays one of the predetermined suggestions based on current weather conditions
                    style: TextStyle(
                      color: Color(0xFF5B5431),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 140,
              child: ListView.builder( // carousel view for selecting one of the next 7 days to see weather conditions
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: dayLabels.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedDayIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDayIndex = index;
                       WeatherDataStored().selectedDay = WeatherDataStored().current.add(Duration(days: index));
                      });
                      loadWeatherData(52.12, 0.07);
                    },
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xFFDAC872).withValues(alpha: 0.70) : Color(0xFFEBE2B4).withValues(alpha: 0.70),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: isSelected
                            ? [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          )
                        ]
                            : [],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        dayLabels[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding( // reorderable grid with all weather conditions
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}