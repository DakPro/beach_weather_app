import 'package:flutter/cupertino.dart';

class CurrentWeatherInfo {
  final Widget Function() pageBuilder;
  final String label;
  final IconData icon;
  final String value;

  CurrentWeatherInfo({required this.pageBuilder,
    required this.label,
    required this.icon,
    required this.value,});
}

class NextDaysWeatherInfo {
  final String day;
  final List<int> temperatures;

  NextDaysWeatherInfo({required this.day, required this.temperatures});
}