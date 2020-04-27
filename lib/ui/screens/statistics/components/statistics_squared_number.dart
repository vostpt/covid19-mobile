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

class SquaredNumberWidget extends StatelessWidget {
  final int value;

  //Default style: TextStyles.h3()
  final TextStyle style;

  SquaredNumberWidget({@required this.value, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        value.toString().toUpperCase(),
        style: style == null ? TextStyles.h3() : style,
      ),
    );
  }
}
