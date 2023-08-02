import 'package:flutter/material.dart';
import 'package:weather_forecast/screens/weatherCity/weather.city.dart';
import 'package:weather_forecast/screens/start/start.dart';
import 'package:weather_forecast/screens/weatherLocation/weather.location.dart';

import 'package:provider/provider.dart';
import 'package:weather_forecast/provider/forecast_provider.dart';
import 'package:weather_forecast/provider/location_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env.development');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ForecastProvider>(
        create: (context) => ForecastProvider(),
      ),
      ChangeNotifierProvider<LocationProvider>(
        create: (context) => LocationProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => const StartScreen(),
          );
        }
        if (settings.name == '/weather-by-city') {
          return MaterialPageRoute(
            builder: (context) => const WeatherByCityScreen(),
          );
        }
        if (settings.name == '/weather-by-location') {
          return MaterialPageRoute(
            builder: (context) => const WeatherByLocation(),
          );
        }

        return MaterialPageRoute(
          builder: (context) => const StartScreen(),
        );
      },
    );
  }
}
