import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/model/open_weather_json_model.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  TempView({required this.snapshot});
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp?.day?.toStringAsFixed(0);
    var description = forecastList[0].weather![0].description?.toUpperCase();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            icon,
            scale: 0.6,
            color: Colors.black87,
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            children: [
              Text(
                '$temp °C',
                style: TextStyle(fontSize: 54.0, color: Colors.black87),
              ),
              Text(
                '$description',
                style: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
