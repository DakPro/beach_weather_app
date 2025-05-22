import 'package:open_meteo/open_meteo.dart';

Future<OpenMeteo> init(double longitude, double latitude) async {
  var response = await WeatherApi(temperatureUnit: TemperatureUnit.celsius).request(
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
    },
  ).timeout(Duration(seconds: 5));

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
}

void main() async {
  var a = await init(1.0, 1.0);
  var currentTemperature = a.getTemperature();
  print(currentTemperature);
}
