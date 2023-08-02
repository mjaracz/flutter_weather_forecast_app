import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherCondition extends StatelessWidget {
  final String weatherCondition;

  const WeatherCondition(this.weatherCondition, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              getIconDataWeather(weatherCondition),
              size: 80,
            ),
          ]),
    );
  }

  IconData getIconDataWeather(String weatherCondition) {
    switch (weatherCondition) {
      case 'Clouds':
        return WeatherIcons.cloud;
      case 'Clear':
        return WeatherIcons.day_sunny;
      case 'Rain':
        return WeatherIcons.rain;
      default:
        return WeatherIcons.celsius;
    }
  }
}
