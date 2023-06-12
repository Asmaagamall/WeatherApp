import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/services/seather_services.dart';

class SearchPage extends StatelessWidget {
  late String CityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search a city")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (data) {
              CityName = data;
            },
            onSubmitted: (data) async {
              CityName = data;
              WeatheService service = WeatheService();
              WeatherModel? weather =
                  await service.getWeather(cityName: CityName);

              Provider.of<WeatherProviders>(context, listen: false)
                  .weatherData = weather;
              Navigator.pop(context);
              // print(weather);
            },
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatheService service = WeatheService();
                      WeatherModel? weather =
                          await service.getWeather(cityName: CityName);

                      Provider.of<WeatherProviders>(context, listen: false)
                          .weatherData = weather;
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                label: Text("City"),
                hintText: "Enter City name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
      ),
    );
  }
}
