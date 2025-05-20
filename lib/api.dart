import 'dart:math';

abstract interface class Weather {
  int getTemperature();
  int getWindSpeed();

  // Percentages
  int getCloudCover();
  int getHumidity();

  // Metrics
  int getAQI();
  int getUV();
}

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
