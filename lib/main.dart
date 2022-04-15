import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/pages/location_page.dart';
import 'pages/weather_forecast_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LocationPage(),
    );
  }
}
