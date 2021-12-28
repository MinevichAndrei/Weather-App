import 'dart:convert';
import 'dart:developer';

import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/constants.dart';

import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {required String cityName}) async {
    var queryParameters = {
      'APPID': Constants.weatherApiKey,
      'units': 'metric',
      'lat': 51.508,
      'lon': -0.1257,
    };

    var uri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath, queryParameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
