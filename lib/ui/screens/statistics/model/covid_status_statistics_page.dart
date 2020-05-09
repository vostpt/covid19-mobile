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

//TODO Improve on this, maybe Enum?
List<String> ages = [
  "0to9",
  "10to19",
  "20to29",
  "30to39",
  "40to49",
  "50to59",
  "60to69",
  "70to79",
  "80plus",
];

class AgeGroupBySex {
  final int order;
  final String ageGroup;
  final double male;
  final double female;

  AgeGroupBySex({
    @required this.order,
    @required this.ageGroup,
    @required this.male,
    @required this.female,
  });
}

class CovidStatusStatistics {
  /// Raw data, full database
  final CovidStatusModel status;

  ///Last updated date
  DateTime _lastUpdatedData;

  ///Confirmed total cases
  int _confirmed;

  /// Percentage growth from previous day
  double _confirmedPercentageNew;

  /// Confirmed absolute growth from previous day
  int _confirmedAbsolutNew;

  /// Recent Confirmed by age Group
  List<AgeGroupBySex> _confirmedRecentByAgeGroup;

  /// Death total cases
  int _death;

  /// Death percentage growth from previous day
  double _deathPercentageNew;

  /// Death absolute growth from previous day
  int _deathAbsolutNew;

  /// How many deaths per day happened
  Map<int, double> _deathsPerDayAbsolut;

  /// Recent death by age Group
  List<AgeGroupBySex> _deathRecentByAgeGroup;

  /// Recovered total cases
  int _recovered;

  /// Recovered percentage growth from previous day
  double _recoveredPercentageNew;

  /// Recovered absolute growth from previous day
  int _recoveredAbsolutNew;

  /// Hospitalized UCI total cases
  int _hospitalizedUCI;

  /// Hospitalized percentage growth from previous day
  double _hospitalizedUCIPercentageNew;

  /// Hospitalized absoulte growth from previous day
  int _hospitalizedUCIAbsolutGrowth;

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

    // CONFIRMED
    _confirmed = status.confirmed.values.last.toInt();
    _confirmedPercentageNew = _calculatePercentage(status.confirmed);
    _confirmedAbsolutNew = _calculateAbsoluteNew(status.confirmed);

    _confirmedRecentByAgeGroup = _calculateByAgeGroup([
      status.confirmedAge0to9SexFemale.entries.last,
      status.confirmedAge10to19SexFemale.entries.last,
      status.confirmedAge20to29SexFemale.entries.last,
      status.confirmedAge30to39SexFemale.entries.last,
      status.confirmedAge40to49SexFemale.entries.last,
      status.confirmedAge50to59SexFemale.entries.last,
      status.confirmedAge60to69SexFemale.entries.last,
      status.confirmedAge70to79SexFemale.entries.last,
      status.confirmedAge80plusFemale.entries.last,
    ], [
      status.confirmedAge0to9SexMale.entries.last,
      status.confirmedAge10to19SexMale.entries.last,
      status.confirmedAge20to29SexMale.entries.last,
      status.confirmedAge30to39SexMale.entries.last,
      status.confirmedAge40to49SexMale.entries.last,
      status.confirmedAge50to59SexMale.entries.last,
      status.confirmedAge60to69SexMale.entries.last,
      status.confirmedAge70to79SexMale.entries.last,
      status.confirmedAge80plusMale.entries.last,
    ]);

    // DEATHS
    _death = status.deaths.values.last.toInt();
    _deathPercentageNew = _calculatePercentage(status.deaths);
    _deathAbsolutNew = _calculateAbsoluteNew(status.deaths);
    _deathsPerDayAbsolut = _calculateAbsolutePerDay(status.deaths);

    _deathRecentByAgeGroup = _calculateByAgeGroup([
      status.deathsAge0to9SexFemale.entries.last,
      status.deathsAge10to19SexFemale.entries.last,
      status.deathsAge20to29SexFemale.entries.last,
      status.deathsAge30to39SexFemale.entries.last,
      status.deathsAge40to49SexFemale.entries.last,
      status.deathsAge50to59SexFemale.entries.last,
      status.deathsAge60to69SexFemale.entries.last,
      status.deathsAge70to79SexFemale.entries.last,
      status.deathsAge80PlusFemale.entries.last
    ], [
      status.deathsAge0to9SexMale.entries.last,
      status.deathsAge10to19SexMale.entries.last,
      status.deathsAge20to29SexMale.entries.last,
      status.deathsAge30to39SexMale.entries.last,
      status.deathsAge40to49SexMale.entries.last,
      status.deathsAge50to59SexMale.entries.last,
      status.deathsAge60to69SexMale.entries.last,
      status.deathsAge70to79SexMale.entries.last,
      status.deathsAge80PlusMale.entries.last
    ]);

    // Recovered
    _recovered = status.recovered.values.last.toInt();
    _recoveredPercentageNew = _calculatePercentage(status.recovered);
    _recoveredAbsolutNew = _calculateAbsoluteNew(status.recovered);

    // Hospitalized UCI
    _hospitalizedUCI = status.hospitalizedUCI.values.last.toInt();
    _hospitalizedUCIPercentageNew =
        _calculatePercentage(status.hospitalizedUCI);
    _hospitalizedUCIAbsolutGrowth =
        _calculateAbsoluteNew(status.hospitalizedUCI);

    // Suspected
    _suspected = status.suspects.values.last.toInt();

    // Waiting results
    _waitingResults = status.waitingResults.values.last.toInt();

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

  /// Latest confirmed by age group
  List<AgeGroupBySex> get confirmedRecentByAgeGroup =>
      _confirmedRecentByAgeGroup;

  /// Confirmed absolute growth from previous day
  int get confirmedAbsolut => _confirmedAbsolutNew;

  /// Death total cases
  int get death => _death;

  /// Death percentage growth from previous day
  double get deathPercentage => _deathPercentageNew;

  /// Death absolute growth from previous day
  int get deathAbsolute => _deathAbsolutNew;

  /// Latest deaths by age group
  List<AgeGroupBySex> get deathRecentByAgeGroup => _deathRecentByAgeGroup;

  /// Recovered total cases
  int get recovered => _recovered;

  /// Recovered percentage growth from previous day
  double get recoveredPercentage => _recoveredPercentageNew;

  /// Recovered absolute growth from previous day
  int get recoveredAbsolute => _recoveredAbsolutNew;

  /// Hospitalized UCI total cases
  int get hospitalizedUCI => _hospitalizedUCI;

  /// Hospitalized UCI percentage growth from previous day
  double get hospitalizedUCIPercentage => _hospitalizedUCIPercentageNew;

  /// Hospitalized UCI absolute growth from previous day
  int get hospitalizedUCIAbsolute => _hospitalizedUCIAbsolutGrowth;

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
  String getReadableLastUpdate(BuildContext context) => _lastUpdatedData == null
      ? ""
      : _lastUpdatedData.parseReadableLastUpdatedAtDate(context);

  /// Calculates the percentage change between last two values
  double _calculatePercentage(Map<int, double> map) {
    if (map == null) {
      return 0.0;
    }
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
    if (map == null) {
      return 0;
    }

    var values = map.values;

    if (map != null && values.length > 1) {
      int current = values.last.toInt();
      int previous = values.elementAt(values.length - 2).toInt();

      int newCases = current - previous;

      return newCases > 0 ? newCases : 0;
    } else {
      return 0;
    }
  }

  //TODO Create the map for all the absolut changes in deaths
  Map<int, double> _calculateAbsolutePerDay(Map<int, double> map) {
    _deathsPerDayAbsolut = <int, double>{};
    _deathsPerDayAbsolut.addEntries([map.entries.first]);

    _deathsPerDayAbsolut.forEach(
      (day, value) {
        int nextDay = day + 1;
        if (map.containsKey(nextDay)) {}
      },
    );

    return _deathsPerDayAbsolut;
  }

  // Given the male and female agegroups returns by a ordered values
  List<AgeGroupBySex> _calculateByAgeGroup(
    List<MapEntry<int, double>> confirmedFemale,
    List<MapEntry<int, double>> confirmedMale,
  ) {
    assert(confirmedFemale.length == 10);
    assert(confirmedMale.length == 10);

    var container = [];

    for (int group = 0; group < ages.length; group++) {
      container.add(
        AgeGroupBySex(
          ageGroup: ages[group],
          female: confirmedFemale[group].value,
          male: confirmedMale[group].value,
          order: group,
        ),
      );
    }

    return container;
  }
}
