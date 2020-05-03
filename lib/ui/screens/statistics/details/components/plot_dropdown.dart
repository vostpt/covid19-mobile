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
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_filter.dart';
import 'package:covid19mobile/ui/widgets/border_decorator.dart';
import 'package:flutter/material.dart';

class Covid19PlotDropdown extends StatefulWidget {
  final Function(StatisticsFilter) onDropdownChanged;

  const Covid19PlotDropdown({Key key, @required this.onDropdownChanged})
      : super(key: key);

  @override
  _Covid19PlotDropdownState createState() => _Covid19PlotDropdownState();
}

class _Covid19PlotDropdownState extends State<Covid19PlotDropdown> {
  StatisticsFilter currentFilter;

  @override
  void initState() {
    currentFilter = StatisticsFilter.last30;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 8.0),
      decoration: Covid19BorderDecorator(),
      child: DropdownButton<String>(
        value: currentFilter.label(context),
        items: StatisticsFilter.values
            .map<DropdownMenuItem<String>>((StatisticsFilter value) {
          String label = value.label(context);
          return DropdownMenuItem<String>(
            value: label,
            child: Text(label,
                style: TextStyles.h2(fontWeight: FontWeight.normal)),
          );
        }).toList(),
        isExpanded: true,
        iconDisabledColor: Covid19Colors.lightGrey,
        iconEnabledColor: Covid19Colors.darkGrey,
        onChanged: (String value) {
          if (currentFilter.label(context).compareTo(value) != 0) {
            currentFilter = StatisticsFilterExtension.fromLabel(context, value);
            setState(() {
              currentFilter =
                  StatisticsFilterExtension.fromLabel(context, value);
              widget.onDropdownChanged(currentFilter);
            });
          }
        },
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Covid19Colors.darkGrey,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyles.h2(fontWeight: FontWeight.normal),
        underline: Container(color: Colors.transparent),
      ),
    );
  }
}
