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

import 'dart:math' as math;
import 'package:covid19mobile/ui/screens/statistics/components/statistics_filter.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_constants.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_dropdown.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_label_gender.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_widgets.dart';
import 'package:covid19mobile/ui/screens/statistics/utils/axis_util.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/providers/covid_status_provider.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_container.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_footer.dart';
import 'package:covid19mobile/ui/screens/statistics/model/covid_status_statistics_page.dart';
import 'fl_flutter_extensions.dart';

class StatisticsHospitalized extends StatefulWidget {
  @override
  _StatisticsHospitalizedState createState() => _StatisticsHospitalizedState();
}

class _StatisticsHospitalizedState extends State<StatisticsHospitalized> {
  @override
  Widget build(BuildContext context) {
    CovidStatusStatistics currentStatistics =
        Provider.of<CovidStatusProvider>(context).statistics;

    return Scaffold(
      backgroundColor: Covid19Colors.paleGrey,
      appBar: AppBar(
        title: Text(
          S.of(context).statisticsHospitalizedCasesTitle.toUpperCase(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatisticsContainer(
                  child: EvolutionTrendPlot(
                    hospitalized: currentStatistics.status.hospitalized,
                    hospitalizedUCI: currentStatistics.status.hospitalizedUCI,
                    title: S.of(context).statisticsHospitalizedCasesTitle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatisticsContainer(
                  child: FullHospitalizedUCICompared(
                    hospitalizedUCIPercentageCompared:
                        currentStatistics.hospitalizedCompared,
                    title: S.of(context).statisticsPageHospitalizedPorpositions,
                  ),
                ),
              ),
              DataInformationFooter(
                currentStatistics: currentStatistics,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EvolutionTrendPlot extends StatefulWidget {
  final String title;

  final Map<int, double> hospitalizedUCI;

  final Map<int, double> hospitalized;

  EvolutionTrendPlot({
    Key key,
    @required this.hospitalized,
    @required this.hospitalizedUCI,
    @required this.title,
  }) : super(key: key);

  @override
  _EvolutionTrendPlotState createState() => _EvolutionTrendPlotState();
}

class _EvolutionTrendPlotState extends State<EvolutionTrendPlot> {
  StatisticsFilter filter;
  double maxY = 1;
  double intervalY = 1;

  @override
  void initState() {
    filter = StatisticsFilter.last30;
    maxY = calculateMaxValue(widget.hospitalized) * 1.2;
    intervalY = calculateDividerInterval(maxY);
    super.initState();
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
              filter = value;
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
              LineChartData(
                maxY: maxY,
                minY: 0,
                lineTouchData: Covid19LineTouchData(),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  verticalInterval: filter.intervalValue(),
                  horizontalInterval: intervalY,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  show: true,
                ),
                titlesData: FlTitlesData(
                  bottomTitles: Covid19PlotBottomSideTitles(
                    days: widget.hospitalized,
                    filter: filter,
                  ),
                  leftTitles: SideTitles(
                      reservedSize: 30,
                      showTitles: true,
                      interval: intervalY,
                      getTitles: (value) {
                        return (value % intervalY == 0)
                            ? "${value.toInt()}"
                            : "";
                      }),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: widget.hospitalized.filterToFlSpot(filter),
                    isCurved: filter != StatisticsFilter.last7,
                    barWidth: 2,
                    colors: [Covid19Colors.lightGreen],
                    dotData: FlDotData(
                      show: false,
                    ),
                  ),
                  LineChartBarData(
                    spots: widget.hospitalizedUCI.filterToFlSpot(filter),
                    isCurved: filter != StatisticsFilter.last7,
                    barWidth: 2,
                    colors: [Covid19Colors.green],
                    dotData: FlDotData(
                      show: false,
                    ),
                  ),
                ],
              ),
              swapAnimationDuration: plotAnimationDuration,
            ),
          ),
        ),
        PlotLabelGender(
          leftLabel: S.of(context).ucihospitalized,
          leftColor: Covid19Colors.green,
          rightLabel: S.of(context).hospitalized,
          rightColor: Covid19Colors.lightGreen,
        ),
      ],
    );
  }

  static double calculateMaxValue(Map<int, double> map) {
    double max = 0;

    if (map == null) {
      return max;
    }

    map.forEach((_, value) {
      if (value != null) {
        max = math.max(max, value);
      }
    });

    return max;
  }
}

class FullHospitalizedUCICompared extends StatefulWidget {
  final String title;

  final Map<int, double> hospitalizedUCIPercentageCompared;

  const FullHospitalizedUCICompared({
    Key key,
    this.title,
    this.hospitalizedUCIPercentageCompared,
  }) : super(key: key);

  @override
  _FullHospitalizedUCIComparedState createState() =>
      _FullHospitalizedUCIComparedState();
}

class _FullHospitalizedUCIComparedState
    extends State<FullHospitalizedUCICompared> {
  StatisticsFilter filter;

  @override
  void initState() {
    filter = StatisticsFilter.last30;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot> currentlyShowingSpots =
        widget.hospitalizedUCIPercentageCompared.filterToFlSpot(filter);

    return Column(
      children: <Widget>[
        PlotHeader(
          header: widget.title,
          dropdown:
              Covid19PlotDropdown(onDropdownChanged: (StatisticsFilter value) {
            setState(() {
              filter = value;
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
              LineChartData(
                maxY: 101, // 101 to show the 100% value
                minY: 0,
                lineTouchData: Covid19LineTouchData(),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  verticalInterval: filter.intervalValue(),
                  horizontalInterval: 25,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  show: true,
                ),
                titlesData: FlTitlesData(
                  bottomTitles: Covid19PlotBottomSideTitles(
                    days: widget.hospitalizedUCIPercentageCompared,
                    filter: filter,
                  ),
                  leftTitles: SideTitles(
                      reservedSize: 30,
                      showTitles: true,
                      interval: 25,
                      getTitles: (value) {
                        return (value % 25 == 0) ? "${value.toInt()}%" : "";
                      }),
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: filter != StatisticsFilter.last7,
                    barWidth: 4,
                    colors: [Covid19Colors.green],
                    spots: List.generate(
                      currentlyShowingSpots.length,
                      (x) => FlSpot(currentlyShowingSpots[x].x, 100),
                    ),
                    dotData: FlDotData(
                      show: false,
                    ),
                  ),
                  LineChartBarData(
                    isCurved: filter != StatisticsFilter.last7,
                    barWidth: 2,
                    colors: [Covid19Colors.lightGreen],
                    spots: currentlyShowingSpots,
                    dotData: FlDotData(
                      show: false,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        PlotLabelGender(
          leftLabel: S.of(context).hospitalized,
          leftColor: Covid19Colors.green,
          rightLabel: S.of(context).ucihospitalized,
          rightColor: Covid19Colors.lightGreen,
        ),
      ],
    );
  }
}
