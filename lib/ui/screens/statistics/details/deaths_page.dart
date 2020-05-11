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
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_constants.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_dropdown.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_types.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_widgets.dart';
import 'package:covid19mobile/ui/screens/statistics/details/confirmed_page.dart';
import 'package:covid19mobile/ui/screens/statistics/model/covid_status_statistics_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticsDeaths extends BasePage {
  @override
  _StatisticsDeathsState createState() => _StatisticsDeathsState();
}

class _StatisticsDeathsState extends BaseState<StatisticsDeaths, AppBloc> {
  @override
  Widget build(BuildContext context) {
    CovidStatusStatistics currentStatistics =
        Provider.of<CovidStatusProvider>(context).statistics;

    return Scaffold(
      backgroundColor: Covid19Colors.paleGrey,
      appBar: AppBar(
        title: Text(
          S.of(context).statisticsDeathCasesTitle.toUpperCase(),
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
                    plotData: currentStatistics.status.deaths,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatisticsContainer(
                  child: DualTrendBarPlot(
                    plotData: currentStatistics.deathsPerDayAbsolut,
                    title: S.of(context).statisticsNewDeathPerDay,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatisticsContainer(
                  child: ByAgeBarPlot(
                    plotDataCategory: currentStatistics.deathRecentByAgeGroup,
                    title: S.of(context).statisticsNewDeathPerAge,
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
  void initBloc(AppBloc bloc) {}

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
          header: "Total de Óbitos",
          dropdown: Covid19PlotDropdown(
              onDropdownChanged: (StatisticsFilter updatedFilter) {
            setState(() {
              _plot.filter = updatedFilter;
            });
          }),
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

class DualTrendBarPlot extends StatefulWidget {
  final Map<int, double> plotData;
  final String title;

  DualTrendBarPlot({@required this.plotData, @required this.title});

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
        PlotHeader(
          header: widget.title,
          dropdown:
              Covid19PlotDropdown(onDropdownChanged: (StatisticsFilter value) {
            setState(() {
              _plot.filter = value;
            });
          }),
        ),
        Divider(
          thickness: 3,
          color: Covid19Colors.lightGrey,
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsetsDirectional.only(top: 37.0),
            width: MediaQuery.of(context).size.width,
            child: BarChart(
              Covid19BarChartData(plotData: _plot),
              swapAnimationDuration: plotAnimationDuration,
            ),
          ),
        ),
      ],
    );
  }
}
