import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final MaterialColor color;

  const GradientContainer({
    super.key,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0, 1.0],
          colors: <Color>[color[800] as Color, color[400] as Color],
        ),
      ),
      child: child,
    );
  }
}
