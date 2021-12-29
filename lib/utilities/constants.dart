import 'package:weather_app/utilities/api_key.dart';

class Constants {
  static const String weatherApiKey = ApiKey.apiKey;
  static const String weatherBaseScheme = 'https://';
  static const String weatherBaseUrlDomain = 'api.openweathermap.org';
  static const String weatherForecastPath = '/data/2.5/onecall';
  static const String geoCoordinatesPath = '/data/2.5/weather';
  static const String weatherImagesPath = '/img/wn/';
  static const String weatherImagesUrl =
      weatherBaseScheme + weatherBaseUrlDomain + weatherImagesPath;
}
