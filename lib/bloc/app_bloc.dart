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

import 'dart:async';

import 'package:covid19mobile/model/api_response_model.dart';
import 'package:covid19mobile/model/stats_model.dart';
import 'package:covid19mobile/services/api_service.dart';
import 'package:covid19mobile/ui/app.dart';
import 'package:rxdart/subjects.dart';

import 'base_bloc.dart';

class AppBloc implements Bloc  {
  static const String _tag = '.AppBloc';

  StreamController onStream = BehaviorSubject<ResultStream>();

  AppBloc() {
    APIService.api.init();
  }

  void foo() async {
    final APIResponse response = await APIService.api.getFoo(null);
    if (response.isOk) {
      logger.i('[$_tag] everything went ok!');
      // do something
    } else {
      logger.e('[$_tag] oops...');
      // throw some error
    }
  }

  void getStats() async {
    final APIResponse response = await APIService.api.getStats();
    if (response.isOk) {
      logger.i('[$_tag] everything went ok!');

      onStream.sink.add(StatsResultStream(
        model: StatsModel.fromJson(response.data),
        state: StateStream.success
      ));

    } else {
      logger.e('[$_tag] oops...');
      // throw some error
    }
  }

  @override
  void dispose() {
    onStream.close();
  }

  @override
  Stream<ResultStream> get onListener => onStream.stream;
}
