import 'package:flutter/material.dart';
import 'package:weather_forecast/shared/widgets/gradient.container.dart';
import 'package:weather_forecast/shared/widgets/textfield.container.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: GradientContainer(
        color: Colors.blue,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                  child: SizedBox(
                      width: 450,
                      height: 550,
                      child: ListView(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 50,
                              bottom: 20,
                            ),
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: const Text(
                              'Choose how search weather',
                              style: TextStyle(fontSize: 30),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const TextFieldContainer(
                            'search by city',
                            '/weather-by-city',
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'or',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          SizedBox(
                            height: 80,
                            child: TextButton(
                              onPressed: () async {
                                await Navigator.of(context).pushNamed(
                                  '/weather-by-location',
                                );
                              },
                              child: const Text(
                                'Search by current location',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              // color: Colors.blue,
                              // textColor: Colors.white,
                              // disabledColor: Colors.blueGrey,
                              // disabledTextColor: Colors.black38,
                              // minWidth: 220,
                            ),
                          )
                        ],
                      )))),
        ),
      ),
    );
  }
}
