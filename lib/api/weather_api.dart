import 'dart:developer';
import 'dart:convert';
import 'package:flutter_application_weather_app/model/open_weather_json_model.dart';
import 'package:flutter_application_weather_app/utilities/constants.dart';
import 'package:flutter_application_weather_app/utilities/location.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWatherForecastWithCity(
      {String cityName = 'London', bool isCity = false}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, dynamic> params;

    if (isCity) {
      Map<String, dynamic> queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
      };
      params = queryParametrs;
    } else {
      Map<String, dynamic> queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.lat.toString(),
        'lon': location.lon.toString(),
      };
      params = queryParametrs;
    }
    Uri uri = Uri.https(
        Constants.WEATHER_BASE_URL, Constants.WEATHER_FORECAST_PATH, params);

    log('request:${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error Response');
    }
  }
}
