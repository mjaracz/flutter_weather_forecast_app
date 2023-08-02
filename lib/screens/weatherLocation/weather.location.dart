import 'package:flutter/material.dart';
import 'package:weather_forecast/model/forecast.dart';
import 'package:weather_forecast/shared/widgets/gradient.container.dart';
import 'package:weather_forecast/shared/widgets/summary.dart';
import 'package:weather_forecast/shared/widgets/return.icon.dart';
import 'package:weather_forecast/shared/widgets/weather.conditon.dart';

import 'package:provider/provider.dart';
import 'package:weather_forecast/provider/location_provider.dart';

class WeatherByLocation extends StatefulWidget {
  const WeatherByLocation({super.key});

  @override
  _WeatherByLocationState createState() => _WeatherByLocationState();
}

class _WeatherByLocationState extends State<WeatherByLocation> {
  late Exception userException;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<LocationProvider>(context, listen: false)
          .getUserLocation();
      await Provider.of<LocationProvider>(context, listen: false)
          .fetchWeatherByCoordinates();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      body: GradientContainer(
          color: Colors.yellow,
          child: locationProvider.forecastModel != null
              ? getHasDataView(locationProvider.forecastModel)
              : const Center(
                  child: SizedBox(
                    height: 20.0,
                    width: 200,
                    child: LinearProgressIndicator(),
                  ),
                )),
    );
  }

  Widget getHasDataView(ForecastModel forecast) {
    return ListView(
      children: [
        ReturnIcon('/'),
        WeatherCondition(forecast.weather.main),
        Summary(forecast.name, forecast.weather.main)
      ],
    );
  }
}
