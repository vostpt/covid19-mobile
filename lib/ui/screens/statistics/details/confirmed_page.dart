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

import 'package:covid19mobile/bloc/app_bloc.dart';
import 'package:covid19mobile/bloc/base_bloc.dart';
import 'package:covid19mobile/providers/covid_status_provider.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_types.dart';
import 'package:covid19mobile/ui/screens/statistics/model/covid_status_statistics_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticsConfirmed extends BasePage {
  @override
  _StatisticsConfirmedState createState() => _StatisticsConfirmedState();
}

class _StatisticsConfirmedState
    extends BaseState<StatisticsConfirmed, AppBloc> {
  @override
  Widget build(BuildContext context) {
    CovidStatusStatistics currentStatistics =
        Provider.of<CovidStatusProvider>(context).statistics;

    return Scaffold(
      backgroundColor: Covid19Colors.paleGrey,
      appBar: AppBar(
        title: Text("CASOS CONFIRMADOS"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TrendPlot(
                currentStatistics: currentStatistics,
              ),
              DualTrendBarPlot(
                currentStatistics: currentStatistics,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    bloc.getCovidStatus();
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is CovidStatusResultStream) {
      Provider.of<CovidStatusProvider>(context, listen: false)
          .setCovidStatus(result.model);
    }
  }
}

class TrendPlot extends StatelessWidget {
  final CovidStatusStatistics currentStatistics;

  TrendPlot({@required this.currentStatistics});
  @override
  Widget build(BuildContext context) {
    final covid19plotLines =
        Covid19PlotLines(data: currentStatistics.status.confirmed);

    return Column(
      children: <Widget>[
        PlotHeader(
          header: "Total de Confirmados",
          swith: Text("<Switcher>"),
        ),

        SafeArea(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: LineChart(
              LineChartData(
                minY: 0,
                lineBarsData: covid19plotLines.lineBarsData,
                lineTouchData: Covid19LineTouchData(),
                gridData: FlGridData(
                  verticalInterval: 7,
                  horizontalInterval: 5000,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  show: true,
                ),
                titlesData: FlTitlesData(
                  bottomTitles: Covid19PlotBottomSideTitles(),
                  leftTitles: Covid19PlotBottomSideTitles(),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Covid19PlotBorder(),
                ),
              ),
              swapAnimationDuration: baseplotSwapAnimationDuration,
            ),
          ),
        ),

        /// --------------------------
        /// Buttons
        /// --------------------------
        PlotButtons(),
      ],
    );
  }
}

class DualTrendBarPlot extends StatelessWidget {
  final CovidStatusStatistics currentStatistics;

  DualTrendBarPlot({@required this.currentStatistics});

  @override
  Widget build(BuildContext context) {
    Covid19PlotBars _plotBars =
        Covid19PlotBars(data: currentStatistics.status.confirmedNew);

    return Column(
      children: <Widget>[
        /// --------------------------
        /// HEADER
        /// --------------------------
        PlotHeader(
          header: "Novos Casos",
          swith: Text("<Switcher>"),
        ),

        /// --------------------------
        /// PLOT
        /// --------------------------
        SafeArea(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: BarChart(
              BarChartData(
                minY: 0,
                barGroups: _plotBars.barsGroupData,
                gridData: FlGridData(
                  verticalInterval: 7,
                  horizontalInterval: 1000,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  show: true,
                ),

                /// -----

                titlesData: FlTitlesData(
                  bottomTitles: Covid19PlotLeftSideTitles(),
                  leftTitles: Covid19PlotBottomSideTitles(),
                ),

                /// -----
                borderData: FlBorderData(
                  show: true,
                  border: Covid19PlotBorder(),
                ),
              ),
              swapAnimationDuration: baseplotSwapAnimationDuration,
            ),
          ),
        ),

        /// --------------------------
        /// Buttons
        /// --------------------------
        // PlotButtons(),
      ],
    );
  }
}
