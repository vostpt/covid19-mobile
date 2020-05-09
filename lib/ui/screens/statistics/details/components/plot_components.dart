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
import 'package:covid19mobile/ui/screens/statistics/components/statistics_filter.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_types.dart';
import 'package:covid19mobile/ui/screens/statistics/model/covid_status_statistics_page.dart';
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

class Covid19BarTouchData extends BarTouchData {
  Covid19BarTouchData()
      : super(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.white,
          ),
          touchCallback: (BarTouchResponse touchResponse) {},
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
            if (value.isNaN || value == 0) {
              return "";
            }
            return "${value.toInt()}";
          },
        );
}

class Covid19PlotBottomSideTitles extends SideTitles {
  Covid19PlotBottomSideTitles(
      {@required Map<int, double> days, @required StatisticsFilter filter})
      : super(
          showTitles: true,
          rotateAngle: 25.0,
          textStyle: TextStyles.statisticsPlotLabel(),
          margin: 14,
          reservedSize: 10,
          getTitles: (double value) {
            //TODO: Improve on this part
            if ((value != null || value % filter.intervalValue() == 0)) {
              // if (days[value.toInt()] != null) {
              //   return parseDateToReadable(days[value.toInt()].toInt());
              // }
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
  }) : super(
          minY: 0,
          maxY: plotData.currentPlotData.maxValue * 1.20,
          lineBarsData: plotData.lineBarsData(),
          lineTouchData: Covid19LineTouchData(),
          gridData: FlGridData(
            verticalInterval: plotData.filter.intervalValue(),
            horizontalInterval: plotData.currentPlotData.interval,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            show: true,
          ),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: Covid19PlotLeftSideTitles(
                interval: plotData.currentPlotData.interval),
            bottomTitles: Covid19PlotBottomSideTitles(
              days: plotData.days(),
              filter: plotData.filter,
            ),
          ),
          borderData: FlBorderData(show: false),
        );
}

class Covid19BarChartData extends BarChartData {
  Covid19BarChartData({@required Covid19PlotBars plotData})
      : super(
          minY: 0,
          barGroups: plotData.barsGroupData(),
          barTouchData: Covid19BarTouchData(),
          gridData: FlGridData(
            verticalInterval: plotData.filter.intervalValue(),
            horizontalInterval: plotData.currentPlotData.interval,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            show: true,
          ),
          titlesData: FlTitlesData(
            leftTitles: Covid19PlotLeftSideTitles(
              interval: plotData.currentPlotData.interval,
            ),
            bottomTitles: Covid19PlotBottomSideTitles(
              days: plotData.days(),
              filter: plotData.filter,
            ),
          ),
          borderData: FlBorderData(
            show: false,
            border: Covid19PlotBorder(),
          ),
        );
}

class Covid19DoubleBarChart extends BarChartData {
  Covid19DoubleBarChart({@required List<AgeGroupBySex> ageGroups})
      : super(
          minY: 0,
          barGroups: parseDoubleBar(ageGroups),
        );

  static List<BarChartGroupData> parseDoubleBar(List<AgeGroupBySex> ageGroups) {
    List<BarChartGroupData> groupedData = [];

    for (var ageGroup in ageGroups) {
      groupedData.add(
        BarChartGroupData(
            x: ageGroup.order,
            barRods: [
              BarChartRodData(
                y: ageGroup.male,
                color: Covid19Colors.green,
              ),
              BarChartRodData(
                y: ageGroup.female,
                color: Covid19Colors.lightGreen,
              ),
            ],
            barsSpace: 4),
      );
    }

    return groupedData;
  }
}
