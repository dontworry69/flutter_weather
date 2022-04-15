import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/api/weather_api.dart';
import 'package:flutter_application_weather_app/model/open_weather_json_model.dart';
import 'package:flutter_application_weather_app/pages/city_page.dart';
import 'package:flutter_application_weather_app/widgets/city_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  const WeatherForecastScreen({Key? key, this.locationWeather})
      : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String cityName;

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = Future<WeatherForecast>.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('openweathermap.org'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWatherForecastWithCity();
            });
          },
        ),
        actions: [
          IconButton(
              onPressed: () async {
                var tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CityPage()));
                if (tappedName != null) {
                  setState(() {
                    cityName = tappedName;
                    forecastObject = WeatherApi().fetchWatherForecastWithCity(
                        cityName: cityName, isCity: true);
                  });
                } else {
                  cityName = 'London';
                }
              },
              icon: Icon(Icons.location_city))
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snaphot) {
                if (snaphot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      CityView(snapshot: snaphot),
                    ],
                  );
                } else {
                  return Center(
                      child: Text(
                    'City not found\n Please enter correct city',
                    style: TextStyle(fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
