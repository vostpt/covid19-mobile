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
import 'package:covid19mobile/ui/screens/statistics/components/number_and_percentage.dart';
import 'package:covid19mobile/ui/screens/statistics/components/see_details.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_container.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_new_absolute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatisticHorizontalWidget extends StatelessWidget {
  final String label;
  final int value;
  final double percentage;
  final int absolute;
  final VoidCallback onTap;

  StatisticHorizontalWidget({
    @required this.label,
    @required this.value,
    @required this.percentage,
    @required this.absolute,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return StatisticsContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyles.h3(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 180),
                child: NumberAndPercentageWidget(
                  value: value,
                  percentage: percentage,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    thickness: 2,
                    color: Covid19Colors.lightGrey,
                  ),
                ),
              ),
              StatisticsNewAbsolute(value: absolute)
            ],
          ),
          SeeDetailsWidget()
        ],
      ),
    );
  }
}
