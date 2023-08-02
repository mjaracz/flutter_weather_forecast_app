import 'package:flutter/material.dart';

class ReturnIcon extends StatelessWidget {
  final String pathReturn;

  const ReturnIcon(this.pathReturn, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 5, left: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
            icon: const Icon(Icons.keyboard_return),
            onPressed: () {
              Navigator.of(context).pushNamed(pathReturn);
            }),
      ),
    );
  }
}
