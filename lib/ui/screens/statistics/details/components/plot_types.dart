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
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:covid19mobile/ui/screens/statistics/utils/axis_util.dart';
import 'package:flutter/material.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:fl_chart/fl_chart.dart';

class PlotData {
  /// Max value of the YY axis
  final double maxValue;

  /// Min value of the YY axis
  final double minValue;

  /// Min value of the XX axis
  final int dayFirst;

  /// Max value of the XX axis
  final int dayLast;

  /// Interval in which the plot should divide in the YY axis
  final double interval;

  PlotData(
    this.maxValue,
    this.minValue,
    this.dayFirst,
    this.dayLast,
    this.interval,
  );
}

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

/// Prepare data to show in lines
class Covid19PlotLines extends BasePlot {
  Covid19PlotLines({
    @required Map<int, double> data,
  }) : super(points: data) {
    initializeData(
      filter: filter,
    );
  }

  List<LineChartBarData> lineBarsData() {
    List<FlSpot> spots = filteredPlotData
        .map(
          (day, value) {
            return MapEntry(
              day,
              FlSpot(
                day.toDouble(),
                value < 0 ? 0 : value, // Never show negative values,
              ),
            );
          },
        )
        .values
        .toList();

    return <LineChartBarData>[
      Covid19PlotLineChartBarData(spots, filter),
    ];
  }
}

/// Prepare data to show in Bar plot
class Covid19PlotBars extends BasePlot {
  Covid19PlotBars({@required data}) : super(points: data) {
    initializeData(
      filter: filter,
    );
  }

  List<BarChartGroupData> barsGroupData() {
    return filteredPlotData
        .map(
          (day, value) {
            return MapEntry(
              day,
              BarChartGroupData(
                x: day,
                barRods: <BarChartRodData>[
                  BarChartRodData(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    width: 10.0,
                    y: value < 0 ? 0 : value,
                    color: Covid19Colors.lightBlue,
                  )
                ],
              ),
            );
          },
        )
        .values
        .toList();
  }
}
