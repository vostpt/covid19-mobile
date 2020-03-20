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
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:flutter/material.dart';

class Brand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '#COVID19',
            style: TextStyle(
              color: Covid19Colors.red,
              fontSize: 24.0,
            ),
          ),
          TextSpan(
            text: 'PT',
            style: TextStyle(
              color: Covid19Colors.green,
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
