import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/widgets/button_background.dart';

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

class CardHome extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color textColor;

  const CardHome({
    Key key,
    @required this.text,
    @required this.callback,
    Color backgroundColor,
    Color textColor,
  }) :
        backgroundColor = backgroundColor ?? Covid19Colors.lightGrey,
        textColor = textColor ?? Covid19Colors.darkGrey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: ButtonBackground(
        color: backgroundColor,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                text.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .display2
                    .copyWith(color: textColor),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: textColor,
            )
          ],
        ),
      ),
    );
  }
}
