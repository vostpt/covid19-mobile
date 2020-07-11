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

import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_filter.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_constants.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_dropdown.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_types/plot_lines.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TrendPlot extends StatefulWidget {
  final Map<int, double> plotData;

  TrendPlot({Key key, @required this.plotData}) : super(key: key);

  @override
  _TrendPlotState createState() => _TrendPlotState();
}

class _TrendPlotState extends State<TrendPlot> {
  Covid19PlotLines _plot;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_plot == null) {
      _plot = Covid19PlotLines(
        data: widget.plotData,
      );
    }

    return Column(
      children: <Widget>[
        PlotHeader(
          header: S.of(context).statisticsDeathsTotalTitle,
          dropdown: Covid19PlotDropdown(
              onDropdownChanged: (StatisticsFilter updatedFilter) {
            setState(() {
              _plot.filter = updatedFilter;
            });
          }),
        ),
        const SizedBox(
          height: 11.0,
        ),
        Container(
          child: Divider(
            height: 3,
            thickness: 3,
            color: Covid19Colors.lightGrey,
          ),
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsetsDirectional.only(top: 37.0),
            width: MediaQuery.of(context).size.width,
            child: LineChart(
              Covid19LineChartData(plotData: _plot),
              swapAnimationDuration: plotAnimationDuration,
            ),
          ),
        ),
      ],
    );
  }
}
