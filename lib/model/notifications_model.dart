import 'package:flutter/foundation.dart';

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

@immutable
class NotificationsModel {
  NotificationsModel({
    this.general = false,
    this.stats = false,
    this.measures = false,
    this.questions = false,
    this.other = false,
  });

  final bool general;
  final bool stats;
  final bool measures;
  final bool questions;
  final bool other;

  NotificationsModel copyWith({
    bool general,
    bool stats,
    bool measures,
    bool questions,
    bool other,
  }) =>
      NotificationsModel(
        general: general ?? this.general,
        stats: stats ?? this.stats,
        measures: measures ?? this.measures,
        questions: questions ?? this.questions,
        other: other ?? this.other,
      );
}
