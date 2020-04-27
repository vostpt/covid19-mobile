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
import 'package:covid19mobile/ui/screens/statistics/components/statistics_border.dart';
import 'package:covid19mobile/ui/widgets/button_background.dart';
import 'package:flutter/material.dart';

class StatsWidget extends StatelessWidget {
  final Color color;
  final String number;
  final String text;
  final TextStyle numberStyle;
  final TextStyle textStyle;

  const StatsWidget(
      {Key key,
      this.color,
      this.number,
      this.text,
      this.numberStyle,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBackground(
      border: 0.0,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: StatisticsBorder(
              color: Covid19Colors.darkGrey,
              text: Text(
                number,
                style: numberStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
