import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_model.dart';

class WeatheService {
  final baseUrl = 'https://api.weatherapi.com/v1';
  final apiKey = '1a20d291511b47a5957194440230106';
  WeatherModel? weather;
  Future<WeatherModel?> getWeather({required String cityName}) async {
    String url = '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7';
    try {
      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(response.body);
      WeatherModel weather = WeatherModel.fromJson(data);
      print(weather);
      return weather;
    } catch (e) {
      print(e);
    }
  }
}
