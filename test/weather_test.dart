import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:beach_weather_app/weather/random_weather.dart';

void main() {
  test("Test random weather", () {
    var r = RandomWeather();

    // Non-exhaustive
    expect(r.getTemperature() > 0, true);
    expect(r.getHumidity() < 100, true);
  });
}