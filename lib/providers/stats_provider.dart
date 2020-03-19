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

import 'package:covid19mobile/model/stats_model.dart';
import 'package:flutter/material.dart';

/// Creates a Provider for updating UI
class StatsProvider with ChangeNotifier {
  String _recovered = "0";
  String get recovered => _recovered;

  String _confirmed = "0";
  String get confirmed => _confirmed;

  String _suspected = "0";
  String get suspected => _suspected;

  String _awaitingResults = "0";
  String get awaitingResults => _awaitingResults;

  String _deaths = "0";
  String get deaths => _deaths;

  setStats(StatsModel stats) {
    _recovered = stats.recovered;
    _confirmed = stats.confirmed;
    _suspected = stats.suspected;
    _awaitingResults = stats.awaitingResults;
    _deaths = stats.deaths;
    notifyListeners();
  }
}
