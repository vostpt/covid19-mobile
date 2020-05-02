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

class PlotButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          child: Text("Linear"),
          onPressed: () {},
        ),
        FlatButton(
          child: Text("Log"),
          onPressed: () {},
        ),
      ],
    );
  }
}

class PlotHeader extends StatelessWidget {
  final String header;

  final Widget swith;

  PlotHeader({@required this.header, @required this.swith});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(
              header,
              style: Theme.of(context).textTheme.title,
            ),
            margin: EdgeInsets.all(10.0),
          ),
        ),
        Expanded(
          child: Container(
            child: swith,
          ),
        )
      ],
    );
  }
}
