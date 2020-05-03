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
import 'package:flutter/material.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:fl_chart/fl_chart.dart';

/// Helpful class to have all information ready to show the
///   various plots
class PlotData {
  /// Data is Filtered by what days
  StatisticsFilter filter;

  /// All data filtered
  Map<int, double> data;

  /// Max value of the YY axis
  double maxValue;

  /// Min value of the YY axis
  double minValue;

  /// Min value of the XX axis
  int dayFirst;

  /// Max value of the XX axis
  int dayLast;

  PlotData({
    this.filter = StatisticsFilter.all,
    this.data,
    this.dayFirst,
    this.dayLast,
    this.maxValue = double.maxFinite,
    this.minValue = double.minPositive,
  });
}

abstract class BasePlot {
  final Map<int, double> linearData;
  Map<int, double> logaritmicData;
  PlotData _currentPlotData;

  BasePlot({@required this.linearData}) {
    logaritmicData = linearData.map((day, value) {
      return MapEntry(day, math.log(value));
    });
  }

  /// Returns the current filtered and selected plot data
  PlotData get currentPlotData => _currentPlotData;

  /// List of days showing in the current
  List<int> days() => _currentPlotData.data.keys.toList();

  /// Returns the data already formatted and filtered
  PlotData getData({
    isLogaritmic,
    StatisticsFilter filter,
  }) {
    Map<int, double> values = <int, double>{};
    values.addAll(isLogaritmic ? logaritmicData : linearData);

    int dayFirst = values.entries.first.key;
    int dayLast = values.entries.last.key;

    switch (filter) {
      case StatisticsFilter.last30:
        values.removeWhere((int day, _) {
          return (day <= dayLast - StatisticsFilter.last30.value());
        });
        break;

      case StatisticsFilter.last7:
        values.removeWhere((int day, _) {
          return (day <= dayLast - StatisticsFilter.last7.value());
        });
        break;

      case StatisticsFilter.all:
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
    StatisticsFilter filter = StatisticsFilter.all,
  }) : super(linearData: data) {
    _currentPlotData = getData(isLogaritmic: logaritmic, filter: filter);
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
    StatisticsFilter filter = StatisticsFilter.last30,
  }) : super(linearData: data) {
    _currentPlotData = getData(isLogaritmic: logaritmic, filter: filter);
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
