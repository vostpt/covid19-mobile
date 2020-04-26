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
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_horizontal.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_number_big.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_vertical.dart';
import 'package:covid19mobile/ui/screens/statistics/model/covid_status_statistics_page.dart';
import 'package:covid19mobile/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticsPage extends BasePage {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends BaseState<StatisticsPage, AppBloc> {
  @override
  Widget build(BuildContext context) {
    CovidStatusStatistics currentStatistics =
        Provider.of<CovidStatusProvider>(context).statisticsPage;

    return Scaffold(
      backgroundColor: Covid19Colors.paleGrey,
      appBar: AppBar(
        backgroundColor: Covid19Colors.paleGrey,
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: Covid19Colors.darkGrey),
        title: Text(
          S.of(context).statisticsPageStatistics.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .display2
              .copyWith(color: Covid19Colors.darkGrey),
        ),
        elevation: 0.0,
      ),
      body: currentStatistics.confirmed == null
          ? Loading()
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Horizontal - Confirmed Cases
                    StatisticHorizontalWidget(
                      label: S.of(context).statisticsPageConfirmed,
                      value: currentStatistics.confirmed,
                      percentage: currentStatistics.confirmedPercentage,
                    ),

                    /// Vertical Info - Deaths | Recovered
                    Row(
                      children: <Widget>[
                        /// Deaths
                        Expanded(
                          child: StatisticVerticalWidget(
                            label: S.of(context).statisticsPageDeaths,
                            value: currentStatistics.death,
                            percentage: currentStatistics.deathPercentage,
                            valueDifference: currentStatistics.deathAbsolute,
                          ),
                        ),

                        /// Vertical Divider
                        Container(
                          width: 8.0,
                        ),

                        /// Recovered
                        Expanded(
                          child: StatisticVerticalWidget(
                            label: S.of(context).statisticsPageRecovered,
                            value: currentStatistics.recovered,
                            percentage: currentStatistics.recoveredPercentage,
                            valueDifference:
                                currentStatistics.recoveredAbsolute,
                          ),
                        ),
                      ],
                    ),

                    /// Horizontal - Hospitalized UCI
                    StatisticHorizontalWidget(
                      label: S.of(context).statisticsPageHospitalizedUCI,
                      value: currentStatistics.hospitalizedUCI,
                      percentage: currentStatistics.hospitalizedUCIPercentage,
                    ),

                    /// Big Numbers
                    ///
                    /// Suspected
                    StatisticsNumberBig(
                      label: S.of(context).statisticsPageSuspects,
                      value: currentStatistics.suspected,
                    ),

                    /// Waiting results
                    StatisticsNumberBig(
                      label: S.of(context).statisticsPageAwaitingResults,
                      value: currentStatistics.waitingResults,
                    ),

                    /// Under surveillance
                    StatisticsNumberBig(
                      label: S.of(context).statisticsPageUnderSurveillance,
                      value: currentStatistics.underSurveillance,
                    ),

                    /// Last update
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                      child: Text(
                        currentStatistics.getReadableLastUpdate(context),
                        style: TextStyles.h3Regular(color: Covid19Colors.grey),
                      ),
                    ),

                    /// Data from...
                    Container(
                      margin:
                          EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                      child: Text(
                        S.of(context).statisticsPageDataLabel,
                        style: TextStyles.h3Regular(color: Covid19Colors.grey),
                      ),
                    ),
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
