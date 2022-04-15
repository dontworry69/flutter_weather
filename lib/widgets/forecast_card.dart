import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/model/open_weather_json_model.dart';
import 'package:flutter_application_weather_app/utilities/forecast_util.dart';

Widget forecastCard(
    {required int index, required AsyncSnapshot<WeatherForecast> snapshot}) {
  List<WeatherList>? forecastList = snapshot.data?.list;
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getFormattedDate(dateTime);
  var dayOfWeek;
  dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecastList[index].temp!.min!.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$dayOfWeek',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '$tempMin °C',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                  ),
                  Image.network(
                    icon,
                    scale: 1.2,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
