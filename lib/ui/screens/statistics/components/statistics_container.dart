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

import 'package:covid19mobile/ui/widgets/border_decorator.dart';
import 'package:flutter/material.dart';

class StatisticsContainer extends StatelessWidget {
  final Widget child;
  final Widget header;
  final VoidCallback onTap;
  final EdgeInsets margins;

  StatisticsContainer({
    @required this.child,
    this.header = const SizedBox(),
    this.onTap,
    this.margins = const EdgeInsets.only(bottom: 8.0),
  });

  get margin => margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margins,
      child: Ink(
        decoration: Covid19StatsBorderDecorator(),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              header,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
