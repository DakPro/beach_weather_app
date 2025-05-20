
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
