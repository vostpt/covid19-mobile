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

import 'package:json_annotation/json_annotation.dart';

part 'covid_server_status.g.dart';

@JsonSerializable(includeIfNull: false)
class CovidServerStatusModel {
  @JsonKey(name: 'status')
  final Map<int, String> status;

  CovidServerStatusModel(
    this.status,
  );

  /// Mapper from Json to Model
  factory CovidServerStatusModel.fromJson(Map<String, dynamic> json) =>
      _$CovidServerStatusModelFromJson(json);

  /// Maps Model to Json
  Map<String, dynamic> toJson() => _$CovidServerStatusModelToJson(this);
}
