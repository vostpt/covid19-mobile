///    This program is free software: you can redistribute it and/or modify
///    it under the terms of the GNU General Public License as published by
///    the Free Software Foundation, either version 3 of the License, or
///    (at your option) any later version.
///
///    This program is distributed in the hope that it will be useful,
///    but WITHOUT ANY WARRANTY; without even the implied warranty of
///    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
///    GNU General Public License for more details.
///
///    You should have received a copy of the GNU General Public License
///    along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:flutter/material.dart';

class NumberAndPercentageWidget extends StatelessWidget {
  final int value;
  final double percentage;

  const NumberAndPercentageWidget(
      {Key key, @required this.value, @required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(4.0),
          child: Text(
            value.toString().toUpperCase(),
            style: TextStyles.statisticsBig(),
          ),
        ),
        Container(
          child: Text(
            _showPercentage(percentage),
            style: TextStyles.h3Regular(color: Covid19Colors.grey),
          ),
        ),
      ],
    );
  }
}

/// Return the label for percentage depending
///   of the value passed.
String _showPercentage(double percentage) {
  String value = percentage.toStringAsFixed(1);

  if (percentage > 0.0) {
    return "(+$value%)";
  }
  if (percentage == 0.0) {
    return "(0%)";
  } else {
    return "($value%)";
  }
}
