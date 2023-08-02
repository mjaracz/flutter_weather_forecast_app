import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final String title;
  final String city;

  const Summary(this.title, this.city, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 23, color: Colors.black38),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              city,
              style: const TextStyle(fontSize: 23, color: Colors.black38),
            )
          ],
        )
      ],
    );
  }
}
