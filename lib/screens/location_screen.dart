import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    var weatherInfo = await WeatherApi().fetchWeatherForecast();

    if (weatherInfo == null) {
      log("WeatherInfo was null: $weatherInfo");
      return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastScreen(locationWeather: weatherInfo);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.lightBlue,
          size: 100,
        ),
      ),
    );
  }
}
