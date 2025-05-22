import 'package:open_meteo/open_meteo.dart';

void main() async {
  final weather = WeatherApi(temperatureUnit: TemperatureUnit.celsius);
  final response = await weather.request(
    latitude: 52.52,
    longitude: 13.41,
    hourly: {WeatherHourly.temperature_2m},
    startDate: DateTime(2024, 8, 10),
    endDate: DateTime(2024, 8, 12),
  );
  final data = response.hourlyData[WeatherHourly.temperature_2m]!;
  final currentTemperature = data.values;
  print(currentTemperature);
}