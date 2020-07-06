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

import 'package:covid19mobile/ui/screens/statistics/components/statistics_filter.dart';
import 'package:fl_chart/fl_chart.dart';

FlSpot _parseMapEntryToFlSpot(MapEntry<int, double> element) {
  double value = element.value;
  if (element.value == null) {
    value = 0;
  }

  return FlSpot(element.key.toDouble(), value);
}

/// Filters a [Map<int, double>] to a [List<FlSpot>]
///   needed to used in the plots of [fl_flutter]
extension FilterMap on Map<int, double> {
  List<FlSpot> filterToFlSpot(StatisticsFilter filter) {
    switch (filter) {
      case StatisticsFilter.last30:
      case StatisticsFilter.last7:
        return entries
            .skip(
              length - filter.value(),
            )
            .map(_parseMapEntryToFlSpot)
            .toList();
        break;
      default:
        return entries.map(_parseMapEntryToFlSpot).toList();
    }
  }
}
