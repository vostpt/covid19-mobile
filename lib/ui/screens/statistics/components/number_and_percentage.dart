import 'package:covid19mobile/resources/constants.dart';

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
import 'package:intl/intl.dart';

class NumberAndPercentageWidget extends StatelessWidget {
  final int value;
  final double percentage;
  final bool shouldWrapContent;

  const NumberAndPercentageWidget(
      {Key key,
      @required this.value,
      @required this.percentage,
      this.shouldWrapContent = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: shouldWrapContent ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: shouldWrapContent
          ? WrapCrossAlignment.start
          : WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(4.0),
          child: Text(
            value.toString().toUpperCase(),
            style: TextStyles.statisticsBig(),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: Text(
            _showPercentage(percentage),
            style:
                TextStyles.h3Number(color: Covid19Colors.statsPercentageNumber),
          ),
        ),
      ],
    );
  }
}

/// Return the label for percentage depending
///   of the value passed.
///
/// Formats the percentage using [defaultLocal]
/// in future this can be changed to get the
/// Locale from Device and format accordingly
///
/// [NumberFormat] ##0.# formats the number
/// to have only 1 decimal place if decimal value
/// is greater then 0, if 0 the decimal place is omitted
///
String _showPercentage(double percentage) {
  var f = NumberFormat("##0.#", defaultLocal);

  String value = f.format(percentage);

  if (percentage > 0.0) {
    return "(+$value%)";
  }
  if (percentage == 0.0) {
    return "(0%)";
  } else {
    return "($value%)";
  }
}
