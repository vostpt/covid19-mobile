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

class ButtonBorderBackground extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Widget child;

  const ButtonBorderBackground(
      {Key key, this.color, this.borderColor, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: child,
    );
  }
}
