import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/model/forecast.dart';
import 'package:weather_forecast/provider/forecast_provider.dart';
import 'package:weather_forecast/shared/widgets/gradient.container.dart';
import 'package:weather_forecast/shared/widgets/return.icon.dart';
import 'package:weather_forecast/shared/widgets/textfield.container.dart';

import '../../shared/widgets/weather.conditon.dart';
import '../../shared/widgets/summary.dart';

class WeatherByCityScreen extends StatefulWidget {
  const WeatherByCityScreen({super.key});

  @override
  _WeatherByCityScreen createState() => _WeatherByCityScreen();
}

class _WeatherByCityScreen extends State<WeatherByCityScreen> {
  late Future<ForecastModel> futureForecast;
  late String searchingCity;
  late ForecastProvider forecastProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      forecastProvider = Provider.of<ForecastProvider>(
        context,
        listen: false,
      );
      forecastProvider.fetchCityWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    final forecastProvider = Provider.of<ForecastProvider>(context);
    return Scaffold(
      body: GradientContainer(
        color: Colors.blue,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: forecastProvider.forecastCityModel != null
                ? getHasDataView(forecastProvider.forecastCityModel)
                : const Center(
                    child: SizedBox(
                      height: 20.0,
                      width: 200,
                      child: LinearProgressIndicator(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget getHasDataView(ForecastModel forecast) {
    return ListView(
      children: [
        const TextFieldContainer(
          'search by city',
          '/weather-by-city',
        ),
        const ReturnIcon('/'),
        WeatherCondition(forecast.weather.main),
        Summary(forecast.name, forecast.weather.main)
      ],
    );
  }
}
