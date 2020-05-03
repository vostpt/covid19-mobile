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
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:flutter/material.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:fl_chart/fl_chart.dart';

enum FilterDays { last30Days, last7Days, all }

/// Helpful class to have all information ready to show the
///   various plots
class PlotData {
  /// Data is Filtered by what days
  final FilterDays filter;

  /// All data filtered
  final Map<int, double> data;

  /// Max value of the YY axis
  final double maxValue;

  /// Min value of the YY axis
  final double minValue;

  /// Min value of the XX axis
  final int dayFirst;

  /// Max value of the XX axis
  final int dayLast;

  PlotData({
    this.filter = FilterDays.all,
    this.data,
    this.dayFirst,
    this.dayLast,
    this.maxValue = double.maxFinite,
    this.minValue = double.minPositive,
  });
}

abstract class BasePlot {
  Map<int, double> _data;
  Map<int, double> _logData;
  PlotData _currentPlotData;

  BasePlot({@required Map<int, double> data}) {
    _data = data;
    _logData = _data.map((day, value) {
      return MapEntry(day, math.log(value));
    });
  }

  /// Returns the current filtered and selected plot data
  PlotData get currentPlotData => _currentPlotData;

  /// List of days showing in the current
  List<int> days() => _currentPlotData.data.keys.toList();

  /// Returns the data already formatted and filtered
  PlotData getData({
    logaritmic = false,
    FilterDays filter = FilterDays.last30Days,
  }) {
    Map<int, double> values = logaritmic ? _logData : _data;

    int dayFirst = values.entries.first.key;
    int dayLast = values.entries.last.key;

    switch (filter) {
      case FilterDays.last30Days:
        values.removeWhere((int day, _) {
          return (day <= dayLast - 30);
        });
        break;

      case FilterDays.last7Days:
        values.removeWhere((int day, _) {
          return (day <= dayLast - 7);
        });
        break;

      case FilterDays.all:
      default:
        break;
    }

    double max = double.minPositive;
    double min = double.maxFinite;

    // Determine wht are the min and max values of YY axis
    values.forEach((day, value) {
      max = math.max(value, max);
      min = math.min(value, min);
    });

    return PlotData(
        data: values,
        filter: filter,
        dayFirst: dayFirst,
        dayLast: dayLast,
        maxValue: max,
        minValue: min);
  }
}

/// Prepare data to show in lines
class Covid19PlotLines extends BasePlot {
  Covid19PlotLines({
    @required data,
    bool logaritmic = false,
    FilterDays filter = FilterDays.all,
  }) : super(data: data) {
    _currentPlotData = getData(logaritmic: logaritmic, filter: filter);
  }

  List<LineChartBarData> lineBarsData() {
    List<FlSpot> spots = _currentPlotData.data
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
      Covid19PlotLineChartBarData(spots),
    ];
  }
}

/// Prepare data to show in Bar plot
class Covid19PlotBars extends BasePlot {
  Covid19PlotBars({
    @required data,
    bool logaritmic = false,
    FilterDays filter = FilterDays.last30Days,
  }) : super(data: data) {
    _currentPlotData = getData(logaritmic: logaritmic, filter: filter);
  }

  List<BarChartGroupData> barsGroupData() {
    return _currentPlotData.data
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
                    color: Covid19Colors.lightGreen,
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
