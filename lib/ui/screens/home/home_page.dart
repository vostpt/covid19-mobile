<<<<<<< HEAD
///     This program is free software: you can redistribute it and/or modify
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


import 'package:covid19mobile/providers/stats_provider.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/app_bloc.dart';
import '../../../bloc/base_bloc.dart';
import '../../app.dart';

class HomePage extends BasePage {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();

  static builder({String title}) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StatsProvider>.value(value: StatsProvider())
      ],
      child: HomePage(title: title)
    );

  }
}

class _HomePageState extends BaseState<HomePage, AppBloc> {


  @override
  Widget build(BuildContext context) {

    var stats = Provider.of<StatsProvider>(context);
    logger.i('[StatsProvider] $stats!');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("Covid App"),
          ),
          Text("Confirmados: ${stats.confirmed}"),
        ],
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
    if(result is StatsResultStream) {

      Provider
          .of<StatsProvider>(context, listen: false)
          .setStats(result.model);
    }
  }
}
