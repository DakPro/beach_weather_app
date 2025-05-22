import 'package:open_meteo/open_meteo.dart';

Future<OpenMeteo> init(double longitude, double latitude) async {
  var response = await WeatherApi(
        temperatureUnit: TemperatureUnit.celsius,
        windspeedUnit: WindspeedUnit.kmh,
      )
      .request(
        latitude: latitude,
        longitude: longitude,
        hourly: {
          WeatherHourly.temperature_2m,
          WeatherHourly.apparent_temperature,
          WeatherHourly.pressure_msl,
          WeatherHourly.precipitation_probability,
          WeatherHourly.precipitation,
          WeatherHourly.cloud_cover,
          WeatherHourly.visibility,
          WeatherHourly.wind_speed_10m,
          WeatherHourly.uv_index,
        },
        daily: {WeatherDaily.sunrise, WeatherDaily.sunset},
        forecastDays: 7,
      )
      .timeout(Duration(seconds: 5));

  return OpenMeteo(response);
}

class OpenMeteo {
  late ApiResponse<WeatherApi> response;

  OpenMeteo(this.response);

  Map<DateTime, num> getTemperature() {
    return response.hourlyData[WeatherHourly.temperature_2m]!.values;
  }

  Map<DateTime, num> getApparentTemperature() {
    return response.hourlyData[WeatherHourly.apparent_temperature]!.values;
  }

  Map<DateTime, num> getPressure() {
    return response.hourlyData[WeatherHourly.pressure_msl]!.values;
  }

  Map<DateTime, num> getPrecipitation() {
    return response.hourlyData[WeatherHourly.precipitation]!.values;
  }

  Map<DateTime, num> getPrecipitationProbability() {
    return response.hourlyData[WeatherHourly.precipitation_probability]!.values;
  }

  Map<DateTime, num> getCloudCover() {
    return response.hourlyData[WeatherHourly.cloud_cover]!.values;
  }

  Map<DateTime, num> getVisibility() {
    return response.hourlyData[WeatherHourly.visibility]!.values;
  }

  Map<DateTime, num> getWindSpeed() {
    return response.hourlyData[WeatherHourly.wind_speed_10m]!.values;
  }

  // First day is today
  List<DateTime> getSunrise() {
    return response.dailyData[WeatherDaily.sunrise]!.values.values
        .map((x) => DateTime.fromMillisecondsSinceEpoch((x * 1000).toInt()))
        .toList();
  }

  List<DateTime> getSunset() {
    return response.dailyData[WeatherDaily.sunset]!.values.values
        .map((x) => DateTime.fromMillisecondsSinceEpoch((x * 1000).toInt()))
        .toList();
  }
}

DateTime roundDay(DateTime d) {
  return DateTime(d.year, d.month, d.day).toUtc();
}

void main() async {
  // All stats are 1 hour behind cus of daylight savings
  // TODO: Fix daylight savings?
  // Cambridge time
  var a = await init(0.0, 52.0);
  var now = DateTime.now();
  print(a.getSunset());
}
