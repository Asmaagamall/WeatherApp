import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  getIcon(index, size) {
    // List<String> lst = [
    //   weatherData!.forecast!.forecastday![1].day!.condition!.text!,
    //   weatherData!.forecast!.forecastday![2].day!.condition!.text!,
    //   weatherData!.forecast!.forecastday![3].day!.condition!.text!
    // ];

    if (weatherData!.forecast!.forecastday![index].day!.condition!.text! ==
        "Sunny")
      return Icon(
        Icons.wb_sunny_rounded,
        size: size,
      );
    else
      return Icon(
        Icons.cloud,
        size: size,
      );
  }

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProviders>(context).weatherData;
    if (weatherData == null) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Weather App'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  icon: Icon(Icons.search_outlined))
            ],
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'there is no weather 😔 start',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'searching now 🔍',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(weatherData?.location?.name ?? " ")),
          leading: Icon(Icons.sailing),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: Icon(Icons.search))
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                Text(
                  "${weatherData!.current!.tempC!.toInt()}°",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
                ),
                // CircleAvatar(
                //     child:
                //
                //        Image.network(weatherData!.current!.condition!.icon!)),

                getIcon(0, 70.0),
                Text(
                  "${weatherData!.current!.condition!.text}   ${weatherData!.forecast!.forecastday![0].day!.maxtempC!.toInt()}° / ${weatherData!.forecast!.forecastday![0].day!.mintempC!.toInt()}°",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Last Update : ${weatherData!.location!.localtime}",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(
                  flex: 2,
                ),

                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "3 day forcast",
                        style: TextStyle(),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            getIcon(1, 25.0),
                            Text(
                                "${weatherData!.forecast!.forecastday![1].day!.condition!.text}"),
                            Text(
                                "${weatherData!.forecast!.forecastday![1].day!.maxtempC!.toInt()}°/${weatherData!.forecast!.forecastday![1].day!.mintempC!.toInt()}°")
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            getIcon(2, 25.0),
                            Text(
                                "${weatherData!.forecast!.forecastday![2].day!.condition!.text}"),
                            Text(
                                "${weatherData!.forecast!.forecastday![2].day!.maxtempC!.toInt()}°/${weatherData!.forecast!.forecastday![2].day!.mintempC!.toInt()}°")
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            getIcon(3, 25.0),
                            Text(
                                "${weatherData!.forecast!.forecastday![3].day!.condition!.text}"),
                            Text(
                                "${weatherData!.forecast!.forecastday![3].day!.maxtempC!.toInt()}°/${weatherData!.forecast!.forecastday![3].day!.mintempC!.toInt()}°")
                          ]),
                    ],
                  ),
                )
              ]),
        ),
      );
    }
  }
}
