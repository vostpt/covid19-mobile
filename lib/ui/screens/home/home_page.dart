import 'package:covid19mobile/providers/faq_provider.dart';
import 'package:covid19mobile/providers/remote_work_provider.dart';
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

import 'package:covid19mobile/providers/faq_provider.dart';
import 'package:covid19mobile/providers/remote_work_provider.dart';
import 'package:covid19mobile/providers/stats_provider.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/app_bloc.dart';
import '../../../bloc/base_bloc.dart';
import '../../app.dart';

/// Creates an HomePage extending [BasePage]
/// that is a StatefulWidget
class HomePage extends BasePage {
  /// Home page view
  HomePage({Key key, this.title}) : super(key: key);

  /// Title of the page view
  final String title;

  @override
  _HomePageState createState() => _HomePageState();

  @override
  Widget get builder => MultiProvider(providers: [
        ChangeNotifierProvider<StatsProvider>.value(value: StatsProvider()),
        ChangeNotifierProvider<RemoteWorkProvider>.value(
            value: RemoteWorkProvider()),
        ChangeNotifierProvider<FaqProvider>.value(value: FaqProvider())
      ], child: HomePage(title: title));
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
    /// Get Case Stats
    bloc.getStats();

    /// Get RemoteWork Posts
    bloc.geRemoteWork();

    /// Get Faq Posts
    bloc.getFaqs();
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is StatsResultStream) {
      Provider.of<StatsProvider>(context, listen: false).setStats(result.model);
    }

    if (result is RemoteWorkResultStream) {
      Provider.of<RemoteWorkProvider>(context, listen: false)
          .setRemoteWork(result.model);
    }

    if (result is FaqResultStream) {
      Provider.of<FaqProvider>(context, listen: false).setFaqs(result.model);
    }
  }
}
