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
import 'package:covid19mobile/ui/screens/statistics/components/statistics_squared_number.dart';
import 'package:flutter/material.dart';

/// Statistics widget to show a squared new absolute values
class StatisticsNewAbsolute extends StatelessWidget {
  final int value;
  final String label;

  StatisticsNewAbsolute({@required this.value, this.label});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        SquaredNumberWidget(
          value: value,
          style: TextStyles.statsNumber(),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          (label == null) ? S.of(context).newPlural : label,
          style: TextStyles.h3Number(),
        )
      ],
    );
  }
}
