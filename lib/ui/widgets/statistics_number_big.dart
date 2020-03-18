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
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  value.toString().toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
