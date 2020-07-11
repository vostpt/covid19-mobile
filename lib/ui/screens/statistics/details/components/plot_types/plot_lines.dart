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

import 'package:covid19mobile/ui/screens/statistics/details/components/plot_base.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_components.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
