import 'package:covid19mobile/resources/constants.dart';
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
import 'package:covid19mobile/ui/screens/statistics/components/statistics_filter.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_constants.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_dropdown.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_types.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DualTrendBarPlot extends StatefulWidget {
  final Map<int, double> plotData;
  final String title;
  final StatisticsFilter filter;

  DualTrendBarPlot({
    Key key,
    @required this.plotData,
    @required this.title,
    this.filter,
  }) : super(key: key);

  @override
  _DualTrendBarPlotState createState() => _DualTrendBarPlotState();
}

class _DualTrendBarPlotState extends State<DualTrendBarPlot> {
  Covid19PlotBars _plotAll;
  Covid19PlotBars _plot30Days;
  Covid19PlotBars _plot7Days;

  StatisticsFilter currentFilter;

  @override
  void initState() {
    super.initState();
    currentFilter = StatisticsFilter.last30;
    _plotAll = Covid19PlotBars(
      data: widget.plotData,
      filter: StatisticsFilter.all,
    );
    _plot30Days = Covid19PlotBars(
      data: widget.plotData,
      filter: StatisticsFilter.last30,
    );
    _plot7Days = Covid19PlotBars(
      data: widget.plotData,
      filter: StatisticsFilter.last7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PlotHeader(
          header: widget.title,
          dropdown:
              Covid19PlotDropdown(onDropdownChanged: (StatisticsFilter value) {
            setState(() {
              currentFilter = value;
            });
          }),
        ),
        Divider(
          thickness: dividerTickness,
          color: Covid19Colors.lightGrey,
        ),
        if (currentFilter == StatisticsFilter.all)
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 37.0),
              width: MediaQuery.of(context).size.width,
              child: BarChart(
                Covid19BarChartData(
                  plotData: _plotAll,
                ),
                swapAnimationDuration: plotAnimationDuration,
              ),
            ),
          ),
        if (currentFilter == StatisticsFilter.last30)
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 37.0),
              width: MediaQuery.of(context).size.width,
              child: BarChart(
                Covid19BarChartData(
                  plotData: _plot30Days,
                ),
                swapAnimationDuration: plotAnimationDuration,
              ),
            ),
          ),
        if (currentFilter == StatisticsFilter.last7)
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 37.0),
              width: MediaQuery.of(context).size.width,
              child: BarChart(
                Covid19BarChartData(
                  plotData: _plot7Days,
                ),
                swapAnimationDuration: plotAnimationDuration,
              ),
            ),
          ),
      ],
    );
  }
}
