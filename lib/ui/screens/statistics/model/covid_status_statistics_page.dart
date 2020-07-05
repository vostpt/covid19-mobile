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
import 'package:covid19mobile/ui/screens/statistics/components/symptoms_naming.dart';
import 'package:flutter/material.dart';
import 'package:covid19mobile/extensions/date_extensions.dart';

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

  /// Recovered per day
  Map<int, double> _recoveredPerDay;

  /// Hospitalized total
  int _hospitalized;

  /// Hospitalized absolute growth from previous day
  double _hospitalizedAbsolutGrowth;

  /// Hospitalized UCI total cases
  int _hospitalizedUCI;

  /// Hospitalized percentage growth from previous day
  double _hospitalizedUCIPercentageNew;

  /// Hospitalized absolute growth from previous day
  int _hospitalizedUCIAbsolutGrowth;

  /// Hospitalized UCI per day
  Map<int, double> _hospitalizedUCIPerDayAbsolut;

  /// Hospitalized per day
  Map<int, double> _hospitalizedPerDayAbsolut;

  /// Suspected total cases;
  int _suspected;

  /// Waiting results total cases;
  int _waitingResults;

  /// Under surveillance total cases;
  int _underSurveillance;

  /// Latest Symptons division
  List<SymptomsPercentage> _symptomsPercentages;

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

    // RECOVERED
    _recovered = status.recovered.values.last.toInt();
    _recoveredPercentageNew = _calculatePercentage(status.recovered);
    _recoveredAbsolutNew = _calculateAbsoluteNew(status.recovered);
    _recoveredPerDay = _calculateAbsolutePerDay(status.recovered);

    // HOSPITALIZED

    _hospitalized = status.hospitalized.values.last.toInt();
    _hospitalizedAbsolutGrowth = _calculatePercentage(status.hospitalized);

    // HOSPITALIZED UCI
    _hospitalizedUCI = status.hospitalizedUCI.values.last.toInt();
    _hospitalizedUCIPercentageNew =
        _calculatePercentage(status.hospitalizedUCI);
    _hospitalizedUCIAbsolutGrowth =
        _calculateAbsoluteNew(status.hospitalizedUCI);
    _hospitalizedUCIPerDayAbsolut =
        _calculateAbsolutePerDay(status.hospitalizedUCI);
    _hospitalizedPerDayAbsolut = _calculateAbsolutePerDay(status.hospitalized);

    // Suspected
    _suspected = status.suspects.values.last.toInt();

    // Waiting results
    _waitingResults = status.waitingResults.values.last.toInt();

    // Under surveillance
    _underSurveillance = status.surveillance.values.last.toInt();

    // Latest Simptons division
    _symptomsPercentages = _calculateSymptonsPercentages([
      MapEntry(
        SymptomType.breathingDifficulties,
        status.symptomsBreathingDifficulties.entries.last,
      ),
      MapEntry(
        SymptomType.cough,
        status.symptomsCough.entries.last,
      ),
      MapEntry(
        SymptomType.fever,
        status.symptomsFever.entries.last,
      ),
      MapEntry(
        SymptomType.generalizedWeakness,
        status.symptomsGeneralizedWeakness.entries.last,
      ),
      MapEntry(
        SymptomType.headache,
        status.symptomsHeadache.entries.last,
      ),
      MapEntry(
        SymptomType.musclePain,
        status.symptomsMusclePain.entries.last,
      )
    ]);
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

  Map<int, double> get deathsPerDayAbsolut => _deathsPerDayAbsolut;

  /// Latest deaths by age group
  List<AgeGroupBySex> get deathRecentByAgeGroup => _deathRecentByAgeGroup;

  /// Recovered total cases
  int get recovered => _recovered;

  /// Recovered percentage growth from previous day
  double get recoveredPercentage => _recoveredPercentageNew;

  /// Recovered absolute growth from previous day
  int get recoveredAbsolute => _recoveredAbsolutNew;

  /// Hospitalized total cases
  int get hospitalized => _hospitalized;

  /// Hospitalized percentaged compared from previous day
  double get hospitalizedPercentage => _hospitalizedAbsolutGrowth;

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

  /// Latest Symptoms detected by percentaged
  List<SymptomsPercentage> get symptomsByPercentage => _symptomsPercentages;

  /// Recovered per day
  Map<int, double> get recoveredPerDay => _recoveredPerDay;

  Map<int, double> get hospitalizedCompared {
    return _hospitalizedUCIPerDayAbsolut.map(
      (key, value) {
        double y = value * 100 % _hospitalizedPerDayAbsolut[key];

        if (y.isInfinite || y.isNaN || y.isNegative) {
          y = 0;
        }

        return MapEntry(key, y);
      },
    );
  }

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

  //TODO Create the map for all the absolut changes
  Map<int, double> _calculateAbsolutePerDay(Map<int, double> map) {
    Map<int, double> container = <int, double>{};

    if (map != null && map.length > 0) {
      container.addEntries([map.entries.first]);
    }

    map.forEach(
      (day, value) {
        if (value == null) {
          container[day] = 0;
        } else {
          int previousDay = day - 1;
          if (map.containsKey(previousDay)) {
            if (map[previousDay] == null) {
              container[day] = value;
            } else {
              container[day] = value - map[previousDay];
            }
          }
        }
      },
    );

    return container;
  }

  // Given the male and female agegroups returns by a ordered values
  List<AgeGroupBySex> _calculateByAgeGroup(
    List<MapEntry<int, double>> confirmedFemale,
    List<MapEntry<int, double>> confirmedMale,
  ) {
    assert(confirmedFemale.length == 9);
    assert(confirmedMale.length == 9);

    List<AgeGroupBySex> container = [];

    for (int group = 0; group < ageGroupDescription.length; group++) {
      container.add(
        AgeGroupBySex(
          ageGroup: ageGroupDescription[group],
          female: confirmedFemale[group].value,
          male: confirmedMale[group].value,
          order: group,
        ),
      );
    }

    return container;
  }

  List<SymptomsPercentage> _calculateSymptonsPercentages(
      List<MapEntry<SymptomType, MapEntry<int, double>>> symptons) {
    List<SymptomsPercentage> container = [];

    for (var order = 0; order < symptons.length; order++) {
      container.add(
        SymptomsPercentage(
          order: order,
          symptom: symptons[order].key,
          percentage: ((symptons[order].value).value * 100).truncate(),
        ),
      );
    }

    return container;
  }
}
