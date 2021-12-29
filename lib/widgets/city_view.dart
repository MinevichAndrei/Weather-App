import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  const CityView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var timezone = snapshot.data!.timezone;
    var city = timezone.split('/')[1];
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data!.current.dt * 1000);
    return Column(
      children: [
        Text(
          city,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.lightBlue,
          ),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: const TextStyle(
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}
