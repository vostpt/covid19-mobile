import 'package:flutter/material.dart';

class Brand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '#COVID19',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 24.0,
            ),
          ),
          TextSpan(
            text: 'PT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
