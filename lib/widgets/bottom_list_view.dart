import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Прогноз на неделю',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.lightBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 160.0,
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 8.0,
            ),
            itemCount: snapshot.data!.daily.length,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.4,
              color: Colors.lightBlue,
              child: forecastCard(snapshot, index),
            ),
          ),
        ),
      ],
    );
  }
}
