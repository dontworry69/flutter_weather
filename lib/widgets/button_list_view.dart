import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/widgets/forecast_card.dart';

import '../model/open_weather_json_model.dart';

class ButtonListView extends StatelessWidget {
  const ButtonListView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontWeight: FontWeight.w800),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.list!.length,
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Colors.black87,
              child: forecastCard(snapshot: snapshot, index: index),
            ),
          ),
        ),
      ],
    );
  }
}
