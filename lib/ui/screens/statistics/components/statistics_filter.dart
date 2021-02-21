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

import 'package:flutter/material.dart';
import 'package:covid19mobile/generated/l10n.dart';

enum StatisticsFilter { last30, last7, all }

extension StatisticsFilterExtension on StatisticsFilter {
  /// return the string representation of the [StatisticsFilter]
  String label(BuildContext context) => {
        StatisticsFilter.last30: S.of(context).lastMonth,
        StatisticsFilter.last7: S.of(context).lastWeek,
        StatisticsFilter.all: S.of(context).all,
      }[this];

  /// Return the numeric value of the [StatisticsFilter]
  int value() => const {
        StatisticsFilter.last30: 30,
        StatisticsFilter.last7: 7,
        StatisticsFilter.all: 0,
      }[this];

  /// Given the [StatisticFilter] what should be the plot XX interval
  double intervalValue() => const {
        StatisticsFilter.last7: 1.0,
        StatisticsFilter.last30: 7.0,
        StatisticsFilter.all: 30.0,
      }[this];

  /// Returns a [StatisticsFilter] given a string label
  static StatisticsFilter fromLabel(BuildContext context, String str) {
    return StatisticsFilter.values.firstWhere(
      (test) => test.label(context) == str,
      orElse: () => StatisticsFilter.all,
    );
  }
}
