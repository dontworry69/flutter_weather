import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/model/open_weather_json_model.dart';
import 'package:flutter_application_weather_app/utilities/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  DetailView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<WeatherList>? forecastList = snapshot.data?.list;
    num pressure = forecastList![0].pressure! * 0.750062;
    var humidity = forecastList[0].humidity;
    double? wind = forecastList[0].speed;
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Util.getItem(Icons.thermostat_auto, pressure.round(), 'mm Hg'),
            Util.getItem(Icons.cloud, humidity!, '%'),
            Util.getItem(Icons.air, wind!.toInt(), 'm/s')
          ]),
    );
  }
}
