import 'package:open_meteo/open_meteo.dart';

void main() async {
  final weather = WeatherApi(temperatureUnit: TemperatureUnit.celsius);
  final response = await weather.request(
    latitude: 52.52,
    longitude: 13.41,
    hourly: {
      WeatherHourly.temperature_2m,
      WeatherHourly.apparent_temperature,
      WeatherHourly.pressure_msl,
      WeatherHourly.precipitation_probability,
      WeatherHourly.precipitation,
      WeatherHourly.cloud_cover,
      WeatherHourly.visibility,
      WeatherHourly.wind_speed_10m,
    },
  );
  final data = response.hourlyData[WeatherHourly.temperature_2m]!;
  final currentTemperature = data.values;
  print(currentTemperature);
}