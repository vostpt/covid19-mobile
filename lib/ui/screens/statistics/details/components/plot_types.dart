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

abstract class BasePlot {
  final Map<int, double> data;
  Map<int, double> logData;

  BasePlot({@required this.data}) {
    logData = data.map((day, value) {
      return MapEntry(day, math.log(value));
    });
  }

  Map<int, double> getData({logaritmic = false}) {
    return logaritmic ? logData : data;
  }
}

class Covid19PlotBars extends BasePlot {
  Covid19PlotBars({@required data}) : super(data: data);

  List<BarChartGroupData> get barsGroupData {
    return getData()
        .map(
          (day, value) {
            return MapEntry(
              day,
              BarChartGroupData(
                x: day,
                barRods: <BarChartRodData>[
                  BarChartRodData(
                    y: value < 0 ? 0 : value,
                    color: Covid19Colors.green,
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

  List<LineChartBarData> get lineBarsData {
    List<FlSpot> spots = getData()
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
