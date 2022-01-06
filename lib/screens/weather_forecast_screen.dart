import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/screens/city_creen.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);
  // final locationWeather;
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_city),
            onPressed: () async {
              var tappedName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CityScreen();
                  },
                ),
              );
              if (tappedName != null) {
                var _cityName = tappedName;
                forecastObject = WeatherApi()
                    .fetchWeatherForecast(cityName: _cityName, isCity: true);
                setState(() {});
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    CityView(snapshot: snapshot),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TempView(snapshot: snapshot),
                    const SizedBox(
                      height: 30.0,
                    ),
                    DetailView(snapshot: snapshot),
                    const SizedBox(
                      height: 30.0,
                    ),
                    BottomListView(snapshot: snapshot),
                  ],
                );
              } else {
                return const Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.lightBlue,
                    size: 100.0,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
