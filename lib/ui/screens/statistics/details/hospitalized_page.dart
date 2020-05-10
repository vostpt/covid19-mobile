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

import 'package:covid19mobile/ui/screens/statistics/components/statistics_filter.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_constants.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_dropdown.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/providers/covid_status_provider.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_container.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_footer.dart';
import 'package:covid19mobile/ui/screens/statistics/model/covid_status_statistics_page.dart';

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
                    title: "Proporção de UCI",
                    hospitalizedUCIPercentageCompared:
                        currentStatistics.hospitalizedCompared,
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PlotHeader(
          header: widget.title,
          dropdown:
              Covid19PlotDropdown(onDropdownChanged: (StatisticsFilter value) {
            setState(() {
              // _plot.filter = value;
            });
          }),
        ),
        const SizedBox(
          height: 11.0,
        ),

        /// --------------------------
        Container(
          child: Divider(
            height: 3,
            thickness: 3,
            color: Covid19Colors.lightGrey,
          ),
        ),

        /// --------------------------
        /// Plot
        /// --------------------------
        SafeArea(
          child: Container(
            margin: const EdgeInsetsDirectional.only(top: 37.0),
            width: MediaQuery.of(context).size.width,
            child: LineChart(
              LineChartData(
                lineTouchData: Covid19LineTouchData(),
                minY: 0,
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  verticalInterval: 100,
                  horizontalInterval: 1000,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  show: true,
                ),
                titlesData: FlTitlesData(
                  bottomTitles: Covid19PlotBottomSideTitles(
                    days: widget.hospitalized,
                    filter: StatisticsFilter.last30,
                  ),
                  leftTitles: SideTitles(
                      reservedSize: 30,
                      showTitles: true,
                      interval: 1000,
                      getTitles: (value) {
                        return (value % 1000 == 0) ? "${value.toInt()}" : "";
                      }),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: parseDataToLine(widget.hospitalized),
                    isCurved: true,
                    barWidth: 2,
                    colors: [Covid19Colors.lightGreen],
                    dotData: FlDotData(
                      show: false,
                    ),
                  ),
                  LineChartBarData(
                    spots: parseDataToLine(widget.hospitalizedUCI),
                    isCurved: true,
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
      ],
    );
  }

  List<FlSpot> parseDataToLine(Map<int, double> hospitalized) {
    List<FlSpot> spots = <FlSpot>[];

    hospitalized.forEach((key, value) {
      if (value == null || value < 0) {
        value = 0;
      }
      spots.add(
        FlSpot(key.toDouble(), value),
      );
    });

    return spots;
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
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      PlotHeader(
        header: widget.title,
        dropdown:
            Covid19PlotDropdown(onDropdownChanged: (StatisticsFilter value) {
          setState(() {
            // _plot.filter = value;
          });
        }),
      ),
      const SizedBox(
        height: 11.0,
      ),

      /// --------------------------
      Container(
        child: Divider(
          height: 3,
          thickness: 3,
          color: Covid19Colors.lightGrey,
        ),
      ),

      /// --------------------------
      /// Plot
      /// --------------------------
      SafeArea(
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 37.0),
          width: MediaQuery.of(context).size.width,
          child: LineChart(
            LineChartData(
              maxY: 101,
              minY: 0,
              lineTouchData: Covid19LineTouchData(),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(
                verticalInterval: 7,
                horizontalInterval: 25,
                drawHorizontalLine: true,
                drawVerticalLine: false,
                show: true,
              ),
              titlesData: FlTitlesData(
                bottomTitles: Covid19PlotBottomSideTitles(
                  days: widget.hospitalizedUCIPercentageCompared,
                  filter: StatisticsFilter.last30,
                ),
                leftTitles: SideTitles(
                    reservedSize: 30,
                    showTitles: true,
                    interval: 25,
                    getTitles: (value) {
                      return (value % 25 == 0) ? "${value.toInt()}" : "";
                    }),
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  barWidth: 2,
                  colors: [Covid19Colors.green],
                  spots: parseSpots(widget.hospitalizedUCIPercentageCompared),
                  dotData: FlDotData(
                    show: false,
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }

  List<FlSpot> parseSpots(Map<int, double> percentages) {
    List<FlSpot> spots = [];

    percentages.forEach(
      (key, value) {
        double x = key.toDouble().isInfinite || key.toDouble().isNaN
            ? 0
            : key.toDouble();
        double y = value.isInfinite || value.isNaN ? 0 : value;

        spots.add(
          FlSpot(x, y),
        );
      },
    );

    return spots;
  }
}
