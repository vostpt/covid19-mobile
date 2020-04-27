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

class StatisticsNumberSmall extends StatelessWidget {
  final int value;
  final String text;

  StatisticsNumberSmall(this.value, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          color: Colors.black,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                value.toString().toUpperCase(),
                style: TextStyles.h2(color: Covid19Colors.green),
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyles.h3(),
        )
      ],
    );
  }
}
