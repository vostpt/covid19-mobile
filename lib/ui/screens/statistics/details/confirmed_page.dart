import 'dart:ui';

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
import 'package:covid19mobile/ui/screens/statistics/components/statistics_container.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_footer.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_constants.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_types.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_widgets.dart';
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
          margin: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StatisticsContainer(
                child: TrendPlot(
                  plotData: currentStatistics.status.confirmed,
                ),
              ),
              StatisticsContainer(
                child: DualTrendBarPlot(
                  plotData: currentStatistics.status.confirmedNew,
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
  final Map<int, double> plotData;

  TrendPlot({@required this.plotData});

  @override
  Widget build(BuildContext context) {
    final _plotLines = Covid19PlotLines(data: plotData);

    return Column(
      children: <Widget>[
        /// --------------------------
        /// Header
        /// --------------------------
        PlotHeader(
          header: "Total de Confirmados",
          swith: Text("<Switcher>"),
        ),

        /// ---
        Divider(
          height: 3,
          thickness: 3,
          color: Covid19Colors.lightGrey,
        ),

        /// --------------------------
        /// Plot
        /// --------------------------
        SafeArea(
          child: Container(
            margin: const EdgeInsetsDirectional.only(top: 37.0),
            width: MediaQuery.of(context).size.width,
            child: LineChart(
              Covid19LineChartData(
                data: _plotLines.lineBarsData(),
              ),
              swapAnimationDuration: plotAnimationDuration,
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
  final Map<int, double> plotData;

  DualTrendBarPlot({@required this.plotData});

  @override
  Widget build(BuildContext context) {
    Covid19PlotBars _plotBars = Covid19PlotBars(data: plotData);

    return Column(
      children: <Widget>[
        /// --------------------------
        /// Header
        /// --------------------------
        PlotHeader(
          header: "Novos Casos",
          swith: Text("<Switcher>"),
        ),

        /// ---
        Divider(
          thickness: 3,
          color: Covid19Colors.lightGrey,
        ),

        /// --------------------------
        /// Plot
        /// --------------------------
        SafeArea(
          child: Container(
            margin: const EdgeInsetsDirectional.only(top: 37.0),
            width: MediaQuery.of(context).size.width,
            child: BarChart(
              Covid19BarChartData(
                data: _plotBars.barsGroupData(),
              ),
              swapAnimationDuration: plotAnimationDuration,
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
