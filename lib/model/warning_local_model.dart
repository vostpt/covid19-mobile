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

part 'warning_local_model.g.dart';

/// Warning Local Model
///
/// this model uses hive to be ready to save it to cache
///
///
@JsonSerializable(includeIfNull: false)
class WarningLocalModel {
  @JsonKey(name: 'local')
  final String local;

  WarningLocalModel(this.local);

  factory WarningLocalModel.fromJson(Map<String, dynamic> json) =>
      _$WarningLocalModelJson(json);

  Map<String, dynamic> toJson() => _$WarningLocalModelJson(this);
}
