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

import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_types.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Covid19LineTouchData extends LineTouchData {
  Covid19LineTouchData()
      : super(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white,
          ),
          touchCallback: (LineTouchResponse touchResponse) {},
          handleBuiltInTouches: true,
        );
}

class Covid19PlotBorder extends Border {
  Covid19PlotBorder()
      : super(
          bottom: BorderSide(color: Colors.transparent),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        );
}

class Covid19PlotLeftSideTitles extends SideTitles {
  Covid19PlotLeftSideTitles({
    @required double interval,
  }) : super(
          showTitles: true,
          interval: interval,
          textStyle: TextStyles.statisticsPlotLabel(),
          margin: 4,
          reservedSize: 40,
          getTitles: (value) {
            if (value == 0) {
              return "";
            }
            return "${value.toInt()}";
          },
        );
}

class Covid19PlotBottomSideTitles extends SideTitles {
  Covid19PlotBottomSideTitles(List<int> days)
      : super(
          showTitles: true,
          rotateAngle: 45.0,
          textStyle: TextStyles.statisticsPlotLabel(),
          margin: 14,
          reservedSize: 10,
          getTitles: (double value) {
            if (value % 7 == 0 && value < days.length) {
              return parseDateToReadable(days.elementAt(value.toInt()));
            }
            return "";
          },
        );

  static String parseDateToReadable(int value) {
    DateTime day = firstDayOfData.add(
      Duration(
        days: value,
      ),
    );
    String month = DateFormat.MMM('pt_PT').format(day).toUpperCase();

    return "${day.day} $month";
  }
}

class Covid19PlotLineChartBarData extends LineChartBarData {
  Covid19PlotLineChartBarData(List<FlSpot> spots)
      : super(
          spots: spots,
          isCurved: true,
          colors: <Color>[Covid19Colors.green],
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            gradientFrom: Offset(0.5, 0.5),
            gradientTo: Offset(1, 1),
            gradientColorStops: [0, 0.95],
            show: true,
            colors: gradientColors
                .map(
                  (color) => color.withOpacity(0.5),
                )
                .toList(),
          ),
        );
}

class Covid19LineChartData extends LineChartData {
  Covid19LineChartData({
    @required Covid19PlotLines plotData,
    double interval = 5000,
  }) : super(
          minY: 0,
          maxY: plotData.currentPlotData.maxValue * 1.20,
          lineBarsData: plotData.lineBarsData(),
          lineTouchData: Covid19LineTouchData(),
          gridData: FlGridData(
            verticalInterval: 7, // number of days of week
            horizontalInterval: interval,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            show: true,
          ),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: Covid19PlotLeftSideTitles(interval: interval),
            bottomTitles: Covid19PlotBottomSideTitles(plotData.days()),
          ),
          borderData: FlBorderData(show: false),
        );
}

class Covid19BarChartData extends BarChartData {
  Covid19BarChartData({
    @required Covid19PlotBars plotData,
    double interval = 500,
  }) : super(
          minY: 0,
          barGroups: plotData.barsGroupData(),
          gridData: FlGridData(
            verticalInterval: 7, // number of days of week
            horizontalInterval: interval,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            show: true,
          ),
          titlesData: FlTitlesData(
            leftTitles: Covid19PlotLeftSideTitles(interval: interval),
            bottomTitles: Covid19PlotBottomSideTitles(plotData.days()),
          ),
          borderData: FlBorderData(
            show: false,
            border: Covid19PlotBorder(),
          ),
        );
}
