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
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/providers/covid_status_provider.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_container.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_filter.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_footer.dart';
import 'package:covid19mobile/ui/screens/statistics/components/symptoms_naming.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_constants.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_dropdown.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_label_gender.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_types.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_widgets.dart';
import 'package:covid19mobile/ui/screens/statistics/model/covid_status_statistics_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

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
        title: Text(
          S.of(context).statisticsConfirmedCasesTitle.toUpperCase(),
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
                  child: TrendPlot(
                    plotData: currentStatistics.status.confirmed,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatisticsContainer(
                  child: DualTrendBarPlot(
                    plotData: currentStatistics.status.confirmedNew,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatisticsContainer(
                  child: ByAgeBarPlot(
                    plotDataCategory:
                        currentStatistics.confirmedRecentByAgeGroup,
                    title: S.of(context).statisticsNewCasesByAgeGroupAndSex,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatisticsContainer(
                  child: SymptomsBarPlot(
                    symptomsPercentages: currentStatistics.symptomsByPercentage,
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

  @override
  void initBloc(AppBloc bloc) {
    // bloc.getCovidStatus();
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

class TrendPlot extends StatefulWidget {
  final Map<int, double> plotData;

  TrendPlot({Key key, @required this.plotData}) : super(key: key);

  @override
  _TrendPlotState createState() => _TrendPlotState(plotData);
}

class _TrendPlotState extends State<TrendPlot> {
  Covid19PlotLines _plot;

  _TrendPlotState(plotData) {
    _plot = Covid19PlotLines(
      data: plotData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /// --------------------------
        /// Header
        /// --------------------------
        PlotHeader(
          header: S.of(context).statisticsTotalConfirmed,
          dropdown:
              Covid19PlotDropdown(onDropdownChanged: (StatisticsFilter value) {
            setState(() {
              _plot.filter = value;
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
              Covid19LineChartData(plotData: _plot),
              swapAnimationDuration: plotAnimationDuration,
            ),
          ),
        ),
      ],
    );
  }
}

class DualTrendBarPlot extends StatefulWidget {
  final Map<int, double> plotData;

  DualTrendBarPlot({Key key, @required this.plotData}) : super(key: key);

  @override
  _DualTrendBarPlotState createState() => _DualTrendBarPlotState();
}

class _DualTrendBarPlotState extends State<DualTrendBarPlot> {
  Covid19PlotBars _plot;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_plot == null) {
      _plot = Covid19PlotBars(data: widget.plotData);
    }

    return Column(
      children: <Widget>[
        /// --------------------------
        /// Header
        /// --------------------------
        PlotHeader(
          header: S.of(context).statisticsNewCases,
          dropdown:
              Covid19PlotDropdown(onDropdownChanged: (StatisticsFilter value) {
            setState(() {
              _plot.filter = value;
            });
          }),
        ),

        /// --------------------------
        Divider(
          thickness: 3,
          color: Covid19Colors.lightGrey,
        ),

        /// --------------------------
        /// Plot
        /// --------------------------
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 37.0),
            width: MediaQuery.of(context).size.width,
            child: BarChart(
              Covid19BarChartData(
                plotData: _plot,
              ),
              swapAnimationDuration: plotAnimationDuration,
            ),
          ),
        ),
      ],
    );
  }
}

class ByAgeBarPlot extends StatelessWidget {
  final List<AgeGroupBySex> plotDataCategory;
  final String title;

  const ByAgeBarPlot({
    Key key,
    this.plotDataCategory,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double interval = calculateDividerInterval(
      calculateMaxValue(plotDataCategory),
    );
    return Column(
      children: <Widget>[
        /// --------------------------
        /// Header
        /// --------------------------
        PlotHeader(header: title),

        /// --------------------------
        Divider(
          thickness: 3,
          color: Covid19Colors.lightGrey,
        ),

        /// --------------------------
        /// Plot
        /// --------------------------
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 37.0),
            width: MediaQuery.of(context).size.width,
            child: BarChart(
              Covid19DoubleBarChart(
                  ageGroups: plotDataCategory, interval: interval),
              swapAnimationDuration: plotAnimationDuration,
            ),
          ),
        ),

        /// --------------------------
        /// Labels
        /// --------------------------
        PlotLabelGender(),
      ],
    );
  }

  static double calculateMaxValue(List<AgeGroupBySex> groups) {
    double max = 0;

    for (var group in groups) {
      max = math.max(max, group.female);
      max = math.max(max, group.male);
    }

    return max;
  }
}

class SymptomsBarPlot extends StatelessWidget {
  final List<SymptomsPercentage> symptomsPercentages;

  const SymptomsBarPlot({Key key, this.symptomsPercentages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /// --------------------------
        /// Header
        /// --------------------------
        PlotHeader(header: S.of(context).statisticsSymptoms),

        /// --------------------------
        Divider(
          thickness: 3,
          color: Covid19Colors.lightGrey,
        ),

        /// --------------------------
        /// Plot
        /// --------------------------
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 37.0),
            width: MediaQuery.of(context).size.width,
            child: BarChart(
              Covid19BarSymptomsPercentageChart(
                context,
                symptomsPercentages: symptomsPercentages,
              ),
              swapAnimationDuration: plotAnimationDuration,
            ),
          ),
        )
      ],
    );
  }
}
