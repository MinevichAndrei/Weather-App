import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.current;
    var icon = forecastList.weather[0].getIconUrl();
    var temp = forecastList.temp.toStringAsFixed(0);
    var description = forecastList.weather[0].description;
    if (temp == "-0") {
      temp = "0";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          icon,
          scale: 0.6,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Column(
          children: [
            Text(
              '$temp °C',
              style: const TextStyle(fontSize: 54.0, color: Colors.lightBlue),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 18.0, color: Colors.black87),
            )
          ],
        ),
      ],
    );
  }
}
