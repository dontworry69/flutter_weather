import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/api/weather_api.dart';
import 'package:flutter_application_weather_app/pages/weather_forecast_home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  void getLocationData() async {
    try {
      var weatherInfo = await WeatherApi().fetchWatherForecastWithCity();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WeatherForecastScreen(
                    locationWeather: weatherInfo,
                  )));
    } catch (e) {
      throw '$e';
    }
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black87,
          size: 100.0,
        ),
      ),
    );
  }
}
