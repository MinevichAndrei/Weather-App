import 'dart:convert';

import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/constants.dart';

import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {required String cityName}) async {
    Map<String, dynamic> result;
    var geoQueryParameters = {
      'appid': Constants.weatherApiKey,
      'q': cityName,
    };

    var geoUri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.geoCoordinatesPath, geoQueryParameters);
    var geoResponse = await http.get(geoUri);
    if (geoResponse.statusCode == 200) {
      result = json.decode(geoResponse.body);
    } else {
      throw Exception('Error response');
    }

    var queryParameters = {
      'appid': Constants.weatherApiKey,
      'exclude': 'hourly,minutely',
      'units': 'metric',
      'lat': result['coord']['lat'].toString(),
      'lon': result['coord']['lon'].toString(),
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
