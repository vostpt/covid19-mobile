import 'package:flutter/material.dart';

class StatisticsNumberSmall extends StatelessWidget {
  final int value;
  final String text;

  StatisticsNumberSmall(this.value, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          color: Colors.black,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                value.toString().toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
