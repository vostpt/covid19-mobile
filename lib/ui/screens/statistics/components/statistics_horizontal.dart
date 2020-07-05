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

import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/statistics/components/number_and_percentage.dart';
import 'package:covid19mobile/ui/screens/statistics/components/see_details.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_container.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_new_absolute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'statistics_title.dart';

class StatisticHorizontalWidget extends StatelessWidget {
  final String label;
  final int value;
  final double percentage;
  final int absolute;
  final String absoluteLabel;
  final VoidCallback onTap;

  StatisticHorizontalWidget({
    @required this.label,
    @required this.value,
    @required this.percentage,
    @required this.absolute,
    this.absoluteLabel,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return StatisticsContainer(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StatisticsTitle(label: label),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: NumberAndPercentageWidget(
                    value: value,
                    percentage: percentage,
                  ),
                ),
              ),
              Container(
                color: Covid19Colors.lightGreyLight,
                height: 32.0,
                width: 1.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 17.0),
                  alignment: Alignment.centerLeft,
                  child: StatisticsNewAbsolute(
                      value: absolute, label: absoluteLabel),
                ),
              ),
            ],
          ),
          SeeDetailsWidget()
        ],
      ),
    );
  }
}
