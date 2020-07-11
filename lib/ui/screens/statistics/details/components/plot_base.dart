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

import 'dart:math' as math;
import 'package:covid19mobile/ui/screens/statistics/components/statistics_filter.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_data.dart';
import 'package:covid19mobile/ui/screens/statistics/utils/axis_util.dart';
import 'package:flutter/material.dart';

class BasePlot {
  final Map<int, double> points;

  PlotData linearData;

  /// Data is Filtered by what days
  StatisticsFilter filter = StatisticsFilter.last30;

  BasePlot({@required this.points, filter = StatisticsFilter.last30});

  /// Returns the current filtered and selected plot data
  PlotData get currentPlotData => linearData;

  Map<int, double> get filteredPlotData {
    int lastDay = currentPlotData.dayLast;
    var values = <int, double>{};
    values.addAll(points);
    switch (filter) {
      case StatisticsFilter.last30:
        values.removeWhere((int day, _) {
          return (day <= lastDay - StatisticsFilter.last30.value());
        });
        break;

      case StatisticsFilter.last7:
        values.removeWhere((int day, _) {
          return (day <= lastDay - StatisticsFilter.last7.value());
        });
        break;

      case StatisticsFilter.all:
      default:
        break;
    }

    return values;
  }

  /// Map of days current showing
  Map<int, double> days() => points;

  /// Returns the data already formatted and filtered
  void initializeData({
    StatisticsFilter filter,
  }) {
    linearData = calculateValues();
  }

  PlotData calculateValues() {
    int dayFirst = points.entries.first.key;
    int dayLast = points.entries.last.key;

    double maxValue = double.minPositive;
    double minValue = double.maxFinite;

    // Determine wht are the min and max values of YY axis
    points.forEach((day, value) {
      maxValue = math.max(value, maxValue);
      minValue = math.min(value, minValue);
    });

    double interval = calculateDividerInterval(maxValue);

    return PlotData(maxValue, minValue, dayFirst, dayLast, interval);
  }
}
