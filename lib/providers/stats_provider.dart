

import 'package:covid19mobile/model/stats_model.dart';
import 'package:flutter/material.dart';

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