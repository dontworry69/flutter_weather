import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/model/open_weather_json_model.dart';
import 'package:flutter_application_weather_app/utilities/forecast_util.dart';
import 'package:flutter_application_weather_app/widgets/button_list_view.dart';
import 'package:flutter_application_weather_app/widgets/detail_view.dart';
import 'package:flutter_application_weather_app/widgets/temp_view.dart';

class CityView extends StatelessWidget {
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    String? city = snapshot.data?.city?.name;
    String? country = snapshot.data?.city?.country;
    var forecastList = snapshot.data?.list;
    var formatedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 28.0,
                color: Colors.black87),
          ),
          Text(
            '${Util.getFormattedDate(formatedDate)}',
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 50.0,
          ),
          TempView(snapshot: snapshot),
          SizedBox(
            height: 50.0,
          ),
          DetailView(snapshot: snapshot),
          SizedBox(
            height: 50.0,
          ),
          ButtonListView(snapshot: snapshot),
        ],
      ),
    );
  }
}
