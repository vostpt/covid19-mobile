import 'package:covid19mobile/ui/screens/statistics/details/components/plot_dual_trend_bar_plot.dart';
import 'package:covid19mobile/ui/screens/statistics/details/map_portugal.dart';

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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/providers/covid_status_provider.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_container.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_footer.dart';
import 'package:covid19mobile/ui/screens/statistics/details/confirmed_page.dart';
import 'package:covid19mobile/ui/screens/statistics/model/covid_status_statistics_page.dart';

class StatisticsRecovered extends StatefulWidget {
  @override
  _StatisticsRecoveredState createState() => _StatisticsRecoveredState();
}

class _StatisticsRecoveredState extends State<StatisticsRecovered> {
  @override
  Widget build(BuildContext context) {
    CovidStatusStatistics currentStatistics =
        Provider.of<CovidStatusProvider>(context).statistics;
    var status = Provider.of<CovidStatusProvider>(context).status;
    return Scaffold(
      backgroundColor: Covid19Colors.paleGrey,
      appBar: AppBar(
        backgroundColor: Covid19Colors.paleGrey,
        title: Text(
          S.of(context).statisticsRecoveredCasesTitle.toUpperCase(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    StatisticsContainer(
                      child: TrendPlot(
                        plotData: currentStatistics.status.recovered,
                        title: S.of(context).statisticsRecoveredCases,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    // TODO(GP): The api doesn't have information about this one
                    // PortugalMapStatistics(
                    //   title: 'Recuperados por região',
                    //   acores: getTotalNumber(status.recoveredARSAcores),
                    //   madeira: getTotalNumber(status.recoveredARSMadeira),
                    //   north: getTotalNumber(status.recoveredARSNorth),
                    //   center: getTotalNumber(status.recoveredARSCenter),
                    //   lvt: getTotalNumber(status.recoveredARSLVT),
                    //   alentejo: getTotalNumber(status.recoveredARSAlentejo),
                    //   algarve: getTotalNumber(status.recoveredARSAlgarve),
                    // ),
                    // const SizedBox(
                    //   height: 8.0,
                    // ),
                    StatisticsContainer(
                      child: DualTrendBarPlot(
                        plotData: currentStatistics.recoveredPerDay,
                        title: S.of(context).statisticsRecoveredPerDay,
                      ),
                    ),
                  ],
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
