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

abstract class BasePlot {
  int _lastDay;
  int _length;
  Map<int, double> _data;
  Map<int, double> _logData;

  BasePlot({@required Map<int, double> data}) {
    _lastDay = data.entries.last.key;
    _length = data.length;
    _data = data;
    _logData = _data.map((day, value) {
      return MapEntry(day, math.log(value));
    });
  }

  Map<int, double> getData({
    logaritmic = false,
    FilterDays days = FilterDays.last30Days,
  }) {
    Map<int, double> values = logaritmic ? _logData : _data;

    switch (days) {
      case FilterDays.last30Days:
        values.removeWhere((int day, _) {
          return (day <= _lastDay - 30);
        });
        return values;
      case FilterDays.last7Days:
        values.removeWhere((int day, _) {
          return (day <= _lastDay - 7);
        });
        return values;
      case FilterDays.all:
      default:
        return values;
    }
  }

  int get length => _length;

  // int get daysToShow => switch () {
  //   case :

  //     break;
  //   default:
  // }
}

class Covid19PlotBars extends BasePlot {
  Covid19PlotBars({@required data}) : super(data: data);

  List<BarChartGroupData> barsGroupData(
      {bool logaritmic = false, FilterDays width = FilterDays.last30Days}) {
    return getData(logaritmic: logaritmic)
        .map(
          (day, value) {
            return MapEntry(
              day,
              BarChartGroupData(
                x: day,
                barRods: <BarChartRodData>[
                  BarChartRodData(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    width: 5.0,
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

class Covid19PlotLines extends BasePlot {
  Covid19PlotLines({@required data}) : super(data: data);

  List<LineChartBarData> lineBarsData({logaritmic = false}) {
    List<FlSpot> spots = getData(logaritmic: logaritmic)
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
