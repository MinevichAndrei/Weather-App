import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    initializeDateFormatting();
    return DateFormat('EEEE, d MMMM y', 'ru-RU').format(dateTime);
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.lightBlue,
          size: 28.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          '$value',
          style: const TextStyle(fontSize: 20.0, color: Colors.black87),
        ),
        Text(
          units,
          style: const TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ],
    );
  }
}
