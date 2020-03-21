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

import 'button_border_background.dart';

class CardBorderArrow extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color textColor;
  final VoidCallback callback;

  const CardBorderArrow({
    Key key,
    @required this.text,
    @required this.callback,
    @required this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: ButtonBorderBackground(
        color: borderColor ?? textColor,
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
            Icon(Icons.arrow_forward, color: textColor)
          ],
        ),
      ),
    );
  }
}
