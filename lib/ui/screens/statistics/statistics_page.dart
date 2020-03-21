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
import 'package:covid19mobile/providers/stats_provider.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/resources/style/themes.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/screens/statistics/components/stats_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _itemsMargin = 8.0;

class StatisticsPage extends BasePage {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();

  @override
  Widget get builder => MultiProvider(providers: [
        ChangeNotifierProvider<StatsProvider>.value(value: StatsProvider())
      ], child: StatisticsPage());
}

class _StatisticsPageState extends BaseState<StatisticsPage, AppBloc> {
  @override
  Widget build(BuildContext context) {
    var stats = Provider.of<StatsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: Covid19Colors.darkGrey),
        title: Text(
          S.of(context).statisticsPageStatistics.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .display2
              .copyWith(color: Covid19Colors.darkGrey),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: StatsWidget(
                color: Covid19Colors.statsBlue,
                number: stats.confirmed,
                numberStyle:
                    TextStyles.statisticsBig(color: Covid19Colors.darkGrey),
                text: S.of(context).statisticsPageConfirmed.toUpperCase(),
                textStyle: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Covid19Colors.darkGrey),
              ),
            ),
            SizedBox(
              height: _itemsMargin,
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: StatsWidget(
                      color: Covid19Colors.statsGreen,
                      number: stats.recovered,
                      numberStyle: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Covid19Colors.darkGrey),
                      text: S.of(context).statisticsPageConfirmed.toUpperCase().toUpperCase(),
                      textStyle: Theme.of(context)
                          .textTheme
                          .display4
                          .copyWith(color: Covid19Colors.darkGrey),
                    ),
                  ),
                  SizedBox(
                    width: _itemsMargin,
                  ),
                  Expanded(
                    child: StatsWidget(
                      color: Covid19Colors.statsRed,
                      number: stats.deaths,
                      numberStyle: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Covid19Colors.darkGrey),
                      text: "Óbitos".toUpperCase(),
                      textStyle: Theme.of(context)
                          .textTheme
                          .display4
                          .copyWith(color: Covid19Colors.darkGrey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _itemsMargin,
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: StatsWidget(
                      color: Covid19Colors.statsYellow,
                      number: stats.suspected,
                      numberStyle: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Covid19Colors.darkGrey),
                      text: S.of(context).statisticsPageSuspects.toUpperCase(),
                      textStyle: Theme.of(context)
                          .textTheme
                          .display4
                          .copyWith(color: Covid19Colors.darkGrey),
                    ),
                  ),
                  SizedBox(
                    width: _itemsMargin,
                  ),
                  Expanded(
                    child: StatsWidget(
                      color: Covid19Colors.statsGrey,
                      number: stats.awaitingResults,
                      numberStyle: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Covid19Colors.darkGrey),
                      text: S.of(context).statisticsPageAwaitingResults.toUpperCase(),
                      textStyle: Theme.of(context)
                          .textTheme
                          .display4
                          .copyWith(color: Covid19Colors.darkGrey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _itemsMargin,
            ),
            Text("${S.of(context).lastUpdated.toUpperCase()} XX",
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(color: Covid19Colors.grey)),
            SizedBox(
              height: _itemsMargin,
            ),
            Text(S.of(context).statisticsPageDataLabel.toUpperCase(),
                style:
                    TextStyles.subtitle(color: Theme.of(context).primaryColor)),
          ],
        ),
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    bloc.getStats();
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is StatsResultStream) {
      Provider.of<StatsProvider>(context, listen: false).setStats(result.model);
    }
  }
}
