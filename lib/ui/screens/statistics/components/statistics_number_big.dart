import 'package:covid19mobile/resources/style/text_styles.dart';

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

import 'package:flutter/material.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_container.dart';

class StatisticsNumberBig extends StatelessWidget {
  final String label;
  final int value;

  StatisticsNumberBig({
    @required this.label,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return StatisticsContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Text(label, style: TextStyles.h3())),
            Text(
              value.toString().toUpperCase(),
              style: TextStyles.statisticsBig(),
            )
          ],
        ),
      ),
    );
  }
}
