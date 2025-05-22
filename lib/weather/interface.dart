
abstract interface class Weather {
  num getTemperature();
  num getWindSpeed();

  // Percentages
  num getCloudCover();
  num getHumidity();

  // Metrics
  num getAQI();
  num getUV();
}
