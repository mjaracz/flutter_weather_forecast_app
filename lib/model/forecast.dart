import 'package:weather_forecast/model/weather.dart';
import 'package:weather_forecast/model/coord.dart';

class ForecastModel {
  final Coord coord;
  final Weather weather;
  final String name;
  final int visibility;

  final double temp;
  final double feelsLike;
  final double tempMax;
  final double tempMin;
  final int pressure;

  ForecastModel(
      {required this.coord,
      required this.weather,
      required this.name,
      required this.visibility,
      required this.temp,
      required this.feelsLike,
      required this.tempMax,
      required this.tempMin,
      required this.pressure});

  factory ForecastModel.fromJson(dynamic json) {
    return ForecastModel(
      coord: Coord.fromJson(json['coord']),
      name: json['name'],
      visibility: json['visibility'],
      weather: Weather.fromJson(json['weather'][0]),
      temp: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      tempMax: json['main']['temp_max'],
      tempMin: json['main']['temp_min'],
      pressure: json['main']['pressure'],
    );
  }
}
