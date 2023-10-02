import 'dart:convert';
//import 'dart:ffi';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

double _dollarRate = 0;
// String _currencyDate = '';

double get dollarRate {
  return _dollarRate;
}

// String get formattedCurrencyDate {
//   final parsedDate = DateTime.parse(_currencyDate);
//   final dateFormat = DateFormat('d MMMM y', 'ru');
//   final formattedDate =
//       dateFormat.format(parsedDate); // Установка локали прямо здесь
//   return formattedDate;
// }

Future<void> fetchRates(void Function(double) updateRate) async {
  const url = 'https://www.cbr-xml-daily.ru/daily_json.js';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var rate = data['Valute']['USD']['Value'].toDouble();
    // var date = data['Date'];

    updateRate(rate as double);
    // _currencyDate = date;
  } else {
    throw Exception('Failed to load rates');
  }
}
