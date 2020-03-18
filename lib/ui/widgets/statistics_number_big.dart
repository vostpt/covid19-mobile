import 'package:flutter/material.dart';

class StatisticsNumberBig extends StatelessWidget {
  final int value;
  final String text;

  StatisticsNumberBig(this.value, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          color: Colors.teal,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              value.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 28),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey, fontSize: 18),
        )
      ],
    );
  }
}
