import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';

class WeatherProviders extends ChangeNotifier {
  WeatherModel? _weatherData;

  set weatherData(WeatherModel? weatherModel) {
    _weatherData = weatherModel;
    notifyListeners();
  }

  WeatherModel? get weatherData {
    return _weatherData;
  }
}
