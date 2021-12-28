import 'dart:convert';
import 'dart:developer';

import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/constants.dart';

import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {required String cityName}) async {
    var queryParameters = {
      'appid': Constants.weatherApiKey,
      'exclude': 'hourly,minutely',
      'units': 'metric',
      'lat': '51.508',
      'lon': '-0.1257',
    };

    var uri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath, queryParameters);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
