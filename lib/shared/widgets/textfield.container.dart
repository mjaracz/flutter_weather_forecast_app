import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/provider/forecast_provider.dart';

class TextFieldContainer extends StatelessWidget {
  final String label;
  final String navigatorPath;

  const TextFieldContainer(this.label, this.navigatorPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 80,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(icon: const Icon(Icons.search), onPressed: () async {}),
          Flexible(
            child: Consumer<ForecastProvider>(
              builder: (context, forecastProvider, child) => TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: label,
                  ),
                  onChanged: (String value) {
                    forecastProvider.saveSearchingCity(value);
                  },
                  onSubmitted: (value) {
                    Navigator.of(context).pushNamed(navigatorPath);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
