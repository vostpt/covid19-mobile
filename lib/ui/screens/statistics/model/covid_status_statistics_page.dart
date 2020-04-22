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

import 'package:covid19mobile/model/covid_status_model.dart';
import 'package:covid19mobile/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:covid19mobile/extensions/date_extensions.dart';

class CovidStatusStatistics {
  /// Raw data, full database
  final CovidStatusModel status;

  ///Last updated date
  DateTime _lastUpdatedData;

  ///Confirmed total cases
  int _confirmed;

  /// Percentage growth from previous day
  double _confirmedPercentageNew;

  /// Death total cases
  int _death;

  /// Death percentage growth from previous day
  double _deathPercentageNew;

  /// Death absolute growth from previous day
  int _deathAbsolutNew;

  /// Recovered total cases
  int _recovered;

  /// Recovered percentage growth from previous day
  double _recoveredPercentageNew;

  /// Recovered absolute growth from previous day
  int _recoveredAbsolutNew;

  /// Hospitalized total cases
  int _hospitalized;

  /// Hospitalized percentage growth from previous day
  double _hospitalizedPercentageNew;

  /// Hospitalized UCI total cases
  int _hospitalizedUCI;

  /// Hospitalized percentage growth from previous day
  double _hospitalizedUCIPercentageNew;

  /// Suspected total cases;
  int _suspected;

  /// Waiting results total cases;
  int _waitingResults;

  /// Under surveillance total cases;
  int _underSurveillance;

  CovidStatusStatistics({this.status}) {
    if (status == null) {
      return;
    }

    _lastUpdatedData = formatDSSGDateTime.parse(status.datesData.values.last);

    // Confirmed
    _confirmed = status.confirmed.values.last.toInt();
    _confirmedPercentageNew = _calculatePercentage(status.confirmed);

    // Death
    _death = status.deaths.values.last.toInt();
    _deathPercentageNew = _calculatePercentage(status.deaths);
    _deathAbsolutNew = _calculateAbsoluteNew(status.deaths);

    // Recovered
    _recovered = status.recovered.values.last.toInt();
    _recoveredPercentageNew = _calculatePercentage(status.recovered);
    _recoveredAbsolutNew = _calculateAbsoluteNew(status.recovered);

    // Hospitalized
    _hospitalized = status.hospitalized.values.last.toInt();
    _hospitalizedPercentageNew = _calculatePercentage(status.hospitalized);

    // Hospitalized UCI
    _hospitalizedUCI = status.hospitalizedUCI.values.last.toInt();
    _hospitalizedUCIPercentageNew =
        _calculatePercentage(status.hospitalizedUCI);

    // Suspected
    _suspected = status.suspects.values.last.toInt();

    // Waiting results
    _waitingResults = status.suspects.values.last.toInt();

    // Under surveillance
    _underSurveillance = status.surveillance.values.last.toInt();
  }

  ///
  /// GETTERS
  ///

  ///Confirmed cases total
  int get confirmed => _confirmed;

  /// Percentage growth from previous day
  double get confirmedPercentage => _confirmedPercentageNew;

  /// Death total cases
  int get death => _death;

  /// Death percentage growth from previous day
  double get deathPercentage => _deathPercentageNew;

  /// Death absolute growth from previous day
  int get deathAbsolute => _deathAbsolutNew;

  /// Recovered total cases
  int get recovered => _recovered;

  /// Recovered percentage growth from previous day
  double get recoveredPercentage => _recoveredPercentageNew;

  /// Recovered absolute growth from previous day
  int get recoveredAbsolute => _recoveredAbsolutNew;

  /// Hospitalized total cases
  int get hospitalized => _hospitalized;

  /// Hospitalized percentage growth from previous day
  double get hospitalizedPercentage => _hospitalizedPercentageNew;

  /// Hospitalized UCI total cases
  int get hospitalizedUCI => _hospitalizedUCI;

  /// Hospitalized percentage growth from previous day
  double get hospitalizedUCIPercentage => _hospitalizedUCIPercentageNew;

  /// Suspected total cases;
  int get suspected => _suspected;

  /// Waiting results total cases;
  int get waitingResults => _waitingResults;

  /// Under surveillance total cases;
  int get underSurveillance => _underSurveillance;

  ///
  /// Helping methods
  ///

  /// Get human friend readable date
  String getReadableLastUpdate(BuildContext context) =>
      _lastUpdatedData.parseReadableLastUpdatedAtDate(context);

  /// Calculates the percentage change between last two values
  double _calculatePercentage(Map<int, double> map) {
    var values = map.values;

    if (values.length > 1) {
      double current = values.last;
      double previous = values.elementAt(values.length - 2);

      return ((current * 100) / previous) - 100;
    } else {
      return 0.0;
    }
  }

  /// Calculates the absolute change between last two values
  int _calculateAbsoluteNew(Map<int, double> map) {
    var values = map.values;

    if (values.length > 1) {
      int current = values.last.toInt();
      int previous = values.elementAt(values.length - 2).toInt();

      int newCases = current - previous;

      return newCases > 0 ? newCases : 0;
    } else {
      return 0;
    }
  }
}
