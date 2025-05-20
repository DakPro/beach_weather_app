import 'dart:math';

import 'package:beach_weather_app/weather/interface.dart';

class RandomWeather implements Weather {
  var rand = Random();

  @override
  int getTemperature() {
    return rand.nextInt(20) + 10;
  }

  @override
  int getWindSpeed() {
    return rand.nextInt(20);
  }

  @override
  int getCloudCover() {
    return rand.nextInt(100);
  }

  @override
  int getHumidity() {
    return rand.nextInt(100);
  }

  @override
  int getAQI() {
    return rand.nextInt(100);
  }

  @override
  int getUV() {
    return rand.nextInt(100);
  }
}
