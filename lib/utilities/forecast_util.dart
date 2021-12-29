import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    initializeDateFormatting();
    return DateFormat('EEEE, d MMMM y', 'ru-RU').format(dateTime);
  }
}
