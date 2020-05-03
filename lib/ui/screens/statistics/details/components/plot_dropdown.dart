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

import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/widgets/border_decorator.dart';
import 'package:flutter/material.dart';

class Covid19PlotDropdown extends StatelessWidget {
  final VoidCallback callback;

  const Covid19PlotDropdown({Key key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 8.0),
      decoration: Covid19BorderDecorator(),
      child: DropdownButton<String>(
        value: "Ultimo Mês",
        items: <String>['Ultima Semana', 'Ultimo Mês', 'Tudo']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String value) {
          // setState({});
        },
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Covid19Colors.darkGrey,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(
          color: Covid19Colors.darkGrey,
        ),
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
