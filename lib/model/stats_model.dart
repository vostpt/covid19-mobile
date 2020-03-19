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

import 'package:json_annotation/json_annotation.dart';

part 'stats_model.g.dart';

/// Stats Model
@JsonSerializable(includeIfNull: false)
class StatsModel {

  /// Recovered total cases
  @JsonKey(name: 'recuperados')
  final String recovered;

  /// Confirmed total cases
  @JsonKey(name: 'confirmados')
  final String confirmed;

  /// Suspected total cases
  @JsonKey(name: 'suspeitos')
  final String suspected;

  /// Cases awaiting for results
  @JsonKey(name: 'aguardar_resultados')
  final String awaitingResults;

  /// Total death cases
  @JsonKey(name: 'obitos')
  final String deaths;

  /// Model constructor
  ///
  /// All properties are mandatory
  ///
  StatsModel(
      this.recovered,
      this.confirmed,
      this.suspected,
      this.awaitingResults,
      this.deaths
  );

  /// Mapper from Json to Model
  factory StatsModel.fromJson(Map<String, dynamic> json) =>
      _$StatsModelFromJson(json);

  /// Maps Model to Json
  Map<String, dynamic> toJson() => _$StatsModelToJson(this);
}