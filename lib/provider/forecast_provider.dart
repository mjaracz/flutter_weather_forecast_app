import 'package:flutter/material.dart';
import 'package:weather_forecast/api/forecast.dart';

class ForecastProvider extends ChangeNotifier {
  String city = '';
  var forecastCityModel;
  var fetchException;

  saveSearchingCity(String searchCity) {
    city = searchCity;
    notifyListeners();
  }

  fetchCityWeather() async {
    try {
      forecastCityModel = await ForecastApi().getForecastByCity(city);
      notifyListeners();
    } catch (e) {
      fetchException = e;
      forecastCityModel = null;
      notifyListeners();
    }
  }
}
