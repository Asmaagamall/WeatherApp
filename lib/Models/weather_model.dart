import 'package:flutter/material.dart';

class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel(
      {required this.location, required this.current, required this.forecast});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }

  @override
  String toString() {
    return 'data is ${location?.name}';
  }
}

class Location {
  String? name;
  String? country;
  String? localtime;

  Location(
      {required this.name, required this.country, required this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    localtime = json['localtime'];
  }
}

class Current {
  String? lastUpdated;
  double? tempC;
  double? tempF;
  Condition? condition;

  Current({this.lastUpdated, this.tempC, this.tempF, this.condition});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }
}

class Condition {
  String? text;
  String? icon;

  Condition({required this.text, required this.icon});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({required this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = List<Forecastday>.empty(growable: true);
      json['forecastday'].forEach((v) {
        forecastday?.add(new Forecastday.fromJson(v));
      });
    }
  }
}

class Forecastday {
  String? date;
  Day? day;

  Forecastday({required this.date, required this.day});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
  }
}

class Day {
  double? maxtempC;
  double? mintempC;
  double? avgtempC;
  Condition? condition;

  Day({this.maxtempC, this.mintempC, this.avgtempC, this.condition});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    mintempC = json['mintemp_c'];
    avgtempC = json['avgtemp_c'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }
}
