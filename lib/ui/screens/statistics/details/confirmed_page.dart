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
    return Scaffold(
      backgroundColor: Covid19Colors.paleGrey,
      appBar: AppBar(),
      body: Container(),
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

// body: Container(
//         margin: EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Container(
//               child: Text(
//                 "Total de Confirmados",
//                 style: Theme.of(context).textTheme.title,
//               ),
//               margin: EdgeInsets.all(10.0),
//             ),
//             SafeArea(
//               child: Container(
//                 padding: EdgeInsets.all(10.0),
//                 child: LineChart(
//                   LineChartData(
//                     lineBarsData: _getData(covidStatus.status),
//                     lineTouchData: LineTouchData(
//                       touchTooltipData: LineTouchTooltipData(
//                         tooltipBgColor: Colors.white,
//                       ),
//                       touchCallback: (LineTouchResponse touchResponse) {},
//                       handleBuiltInTouches: true,
//                     ),
//                     gridData: FlGridData(
//                       show: false,
//                     ),
//                     titlesData: FlTitlesData(
//                       bottomTitles: SideTitles(
//                           showTitles: true,
//                           reservedSize: 30,
//                           textStyle: const TextStyle(
//                             color: Covid19Colors.grey,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                           margin: 10,
//                           getTitles: (value) {
//                             if (value % 20 == 0) {
//                               DateTime day =
//                                   firstDay.add(Duration(days: value.toInt()));
//                               String month = DateFormat.MMM('pt_PT')
//                                   .format(day)
//                                   .toUpperCase();

//                               return "${day.day} $month";
//                             }
//                             return "";
//                           }),
//                       leftTitles: SideTitles(
//                           showTitles: true,
//                           interval: 5000,
//                           textStyle: const TextStyle(
//                             color: Covid19Colors.grey,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                           margin: 8,
//                           reservedSize: 40,
//                           getTitles: (value) {
//                             if (value == 0) return "";
//                             return "${value.toInt()}";
//                           }),
//                     ),
//                     borderData: FlBorderData(
//                       show: true,
//                       border: const Border(
//                         bottom: BorderSide(
//                           color: Colors.grey,
//                           width: 2,
//                         ),
//                         left: BorderSide(
//                           color: Colors.grey,
//                           width: 2,
//                         ),
//                         right: BorderSide(
//                           color: Colors.transparent,
//                         ),
//                         top: BorderSide(
//                           color: Colors.transparent,
//                         ),
//                       ),
//                     ),
//                   ),
//                   swapAnimationDuration: Duration(milliseconds: 400),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
