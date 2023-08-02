import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_forecast/api/forecast.dart';

class LocationProvider extends ChangeNotifier {
  var userLocation;
  var userException;
  var location;
  var forecastModel;

  getUserLocation() async {
    try {
      location = Location();
      notifyListeners();
      userLocation = await location.getLocation();
      notifyListeners();
    } catch (e) {
      userLocation = null;
      userException = e;
      notifyListeners();
    }
  }

  fetchWeatherByCoordinates() async {
    try {
      forecastModel = await ForecastApi().getForecastByCoordinates(
        userLocation.longitude,
        userLocation.latitude,
      );
      notifyListeners();
    } catch (e) {
      userException = e;
      forecastModel = null;
      notifyListeners();
    }
  }
}
