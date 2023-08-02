import 'package:http/http.dart' as http;
import 'package:weather_forecast/model/forecast.dart';

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ForecastApi {
  Future<ForecastModel> getForecastByCity(String city) async {
    http.Response response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${dotenv.env['WEATHER_APP_ID']}',
      ),
    );
    if (response.statusCode <= 299) {
      return ForecastModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception(
        'load city weather failed, status code: ${response.statusCode}',
      );
    }
  }

  Future<ForecastModel> getForecastByCoordinates(double lon, double lat) async {
    http.Response response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=${dotenv.env['WEATHER_APP_ID']}',
      ),
    );
    if (response.statusCode <= 299) {
      return ForecastModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception(
        'load city weather failed, status code: ${response.statusCode}',
      );
    }
  }
}
