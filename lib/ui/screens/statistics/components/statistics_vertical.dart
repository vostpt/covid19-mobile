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

import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/statistics/components/number_and_percentage.dart';
import 'package:covid19mobile/ui/screens/statistics/components/see_details.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_container.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatisticVerticalWidget extends StatelessWidget {
  final String label;
  final double percentage;
  final int value;
  final int valueDifference;

  StatisticVerticalWidget({
    ///Description label of the showing value
    @required this.label,

    ///Percentage difference of the value with the previous day
    @required this.percentage,

    ///Current value
    @required this.value,

    ///Absolute different of the value with the previous day
    @required this.valueDifference,
  });

  @override
  Widget build(BuildContext context) {
    return StatisticsContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: TextStyles.h3()),
          NumberAndPercentageWidget(value: value, percentage: percentage),
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 6.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Covid19Colors.lightGrey,
                    ),
                  ),
                  child: Text(
                    valueDifference.toString().toUpperCase(),
                    style: TextStyles.h3(),
                  ),
                ),
                StatisticsDivider(),
                Text(
                  S.of(context).newPlural,
                  style: TextStyles.h3Regular(),
                ),
              ],
            ),
          ),
          SeeDetailsWidget()
        ],
      ),
    );
  }
}
