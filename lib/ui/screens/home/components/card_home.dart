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
import 'package:covid19mobile/ui/assets/colors.dart';

class CardHome extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const CardHome({
    Key key,
    @required this.text,
    @required this.callback,
    Color borderColor,
    Color backgroundColor,
    Color textColor,
  })  : backgroundColor = backgroundColor ?? Covid19Colors.lightGrey,
        textColor = textColor ?? Covid19Colors.darkGrey,
        borderColor = borderColor ?? Colors.transparent,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: backgroundColor == Covid19Colors.green ? Covid19Colors.grey : Covid19Colors.green,
      ),
      child: ListTileTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        child: Card(
          color: backgroundColor,
          shape: borderColor != Colors.transparent ? ContinuousRectangleBorder(
            side: BorderSide(
              color: borderColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ) : null,
          elevation: 0.0,
          child: ListTile(
            onTap: callback,
            title: Text(
              text.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .copyWith(color: textColor),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
