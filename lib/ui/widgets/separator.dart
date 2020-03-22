/*  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import 'package:covid19mobile/ui/assets/dimensions.dart';
import 'package:flutter/material.dart';

import '../assets/colors.dart';

class Separator extends StatelessWidget {
  Separator({Key key, Color color})
      : _color = color ?? Covid19Colors.green,
        super(key: key);

  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: _color,
      endIndent: identMargin,
      indent: identMargin,
      thickness: 2.0,
    );
  }
}

class ListSeparator extends StatelessWidget {
  ListSeparator({Key key, Color color})
      : _color = color ?? Covid19Colors.green,
        super(key: key);

  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: _color,
      thickness: 2.0,
    );
  }
}
