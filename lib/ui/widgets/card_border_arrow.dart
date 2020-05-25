import 'package:covid19mobile/resources/icons_svg.dart';
import 'package:covid19mobile/ui/assets/colors.dart';

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
  final Color color;

  const CardBorderArrow({
    Key key,
    @required this.text,
    @required this.callback,
    @required this.textColor,
    Color color,
    this.borderColor,
  })  : color = color ?? Covid19Colors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: ButtonBorderBackground(
        borderColor: borderColor ?? textColor,
        color: color,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                text.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: textColor),
              ),
            ),
            SvgIcons.linkSvg(
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
