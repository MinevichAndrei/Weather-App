import 'dart:convert';

import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/constants.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String> parameters;
    Map<String, dynamic> result;

    if (isCity == true) {
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
        'lang': 'ru',
        'lat': result['coord']['lat'].toString(),
        'lon': result['coord']['lon'].toString(),
      };

      parameters = queryParameters;
    } else {
      var queryParameters = {
        'appid': Constants.weatherApiKey,
        'exclude': 'hourly,minutely',
        'units': 'metric',
        'lang': 'ru',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = queryParameters;
    }

    var uri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath, parameters);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
