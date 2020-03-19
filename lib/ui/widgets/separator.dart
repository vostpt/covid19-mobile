import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: 10.0,
      indent: 10.0,
      thickness: 2.0,
    );
  }
}
