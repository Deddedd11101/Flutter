import 'package:flutter/material.dart';
//import 'package:intl/date_symbol_data_http_request.dart';
import 'currency.dart';
// import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vostrikov',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Vostrikov App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _dollarRate = 0; // Объявление _dollarRate как поле класса
  @override
  void initState() {
    super.initState();
    fetchRates(updateRate); // Pass the update function
  }

  void updateRate(double rate) {
    setState(() {
      _dollarRate = rate; // Update _dollarRate and trigger a rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _dollarRate != 0
                  // Курс валют на $formattedCurrencyDate:
                  ? '1 💲 = $_dollarRate 🪆'
                  : 'Загрузка курса...',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
