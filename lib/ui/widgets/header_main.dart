import 'package:flutter/material.dart';
import 'brand.dart';

class HeaderMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: Brand(),
        ),
      ],
    );
  }
}
