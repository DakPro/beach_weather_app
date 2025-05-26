import 'package:open_meteo/open_meteo.dart';

Future<OpenMeteo> initOpenMeteo(double longitude, double latitude) async {
  const timeout = Duration(seconds: 5);

  // Get weather information from OpenMeteo API
  var weather = await WeatherApi(
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
      .timeout(timeout);

  // AQI has a separate API since there are different ways of measuring AQI
  // Use the US AQI since it's standard
  var aqi = await AirQualityApi()
      .request(
        latitude: latitude,
        longitude: longitude,
        hourly: {AirQualityHourly.us_aqi},
      )
      .timeout(timeout);

  return OpenMeteo(weather, aqi);
}

class OpenMeteo {
  late ApiResponse<WeatherApi> weather;
  late ApiResponse<AirQualityApi> aqi;

  OpenMeteo(this.weather, this.aqi);

  // Map times to numbers to get hourly data
  Map<DateTime, num> getTemperature() {
    return weather.hourlyData[WeatherHourly.temperature_2m]!.values;
  }

  Map<DateTime, num> getApparentTemperature() {
    return weather.hourlyData[WeatherHourly.apparent_temperature]!.values;
  }

  Map<DateTime, num> getPressure() {
    return weather.hourlyData[WeatherHourly.pressure_msl]!.values;
  }

  Map<DateTime, num> getPrecipitation() {
    return weather.hourlyData[WeatherHourly.precipitation]!.values;
  }

  Map<DateTime, num> getPrecipitationProbability() {
    return weather.hourlyData[WeatherHourly.precipitation_probability]!.values;
  }

  Map<DateTime, num> getCloudCover() {
    return weather.hourlyData[WeatherHourly.cloud_cover]!.values;
  }

  Map<DateTime, num> getVisibility() {
    return weather.hourlyData[WeatherHourly.visibility]!.values;
  }

  Map<DateTime, num> getWindSpeed() {
    return weather.hourlyData[WeatherHourly.wind_speed_10m]!.values;
  }

  // First item is today's value
  // Keep items in list since it's daily rather than hourly
  List<DateTime> getSunrise() {
    return weather.dailyData[WeatherDaily.sunrise]!.values.values
        .map((x) => DateTime.fromMillisecondsSinceEpoch((x * 1000).toInt()))
        .toList();
  }

  List<DateTime> getSunset() {
    return weather.dailyData[WeatherDaily.sunset]!.values.values
        .map((x) => DateTime.fromMillisecondsSinceEpoch((x * 1000).toInt()))
        .toList();
  }

  Map<DateTime, num> getAQI() {
    // Many AQI measures available. Use US one for now
    return aqi.hourlyData[AirQualityHourly.us_aqi]!.values;
  }
}

DateTime roundDay(DateTime d) {
  return DateTime(d.year, d.month, d.day).toUtc();
}

void main() async {
  // All stats are 1 hour behind cus of daylight savings
  // TODO: Fix daylight savings?
  // Cambridge time
  var a = await initOpenMeteo(0.13, 52.2);
  var now = DateTime.now();
  print(now.toUtc());
  print(a.getSunset());
  print(a.getAQI());
}
