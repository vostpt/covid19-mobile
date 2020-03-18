import 'package:flutter/material.dart';

class StatisticsNumberSmall extends StatelessWidget {
  ///number displayed
  final int value;

  ///text displayed
  final String text;

  ///Widget StatisticsNumberSmall requires value and text
  StatisticsNumberSmall(this.value, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          value.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
