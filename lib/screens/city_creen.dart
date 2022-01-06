import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                cursorColor: Colors.lightBlue,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Введите название города",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.lightBlue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.lightBlue,
                    size: 50.0,
                  ),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 30.0),
                ),
                child: const Text('Получить погоду'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
