import 'package:covid19mobile/ui/assets/dimensions.dart';
import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: identMargin,
      indent: identMargin,
      thickness: 2.0,
    );
  }
}
