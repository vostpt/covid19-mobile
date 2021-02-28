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
import 'package:covid19mobile/ui/screens/statistics/components/symptoms_naming.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_lines_functions.dart';
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_types.dart';
import 'package:covid19mobile/ui/screens/statistics/model/age_group_by_sex.dart';
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

class Covid19PercentageLineTouchData extends LineTouchData {
  Covid19PercentageLineTouchData()
      : super(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.white,
            getTooltipItems: _lineTooltipItem,
            fitInsideVertically: true,
            fitInsideHorizontally: true,
          ),
          touchCallback: (LineTouchResponse touchResponse) {},
          handleBuiltInTouches: true,
        );

  static List<LineTooltipItem> _lineTooltipItem(List<LineBarSpot> touchedSpots) {
    if (touchedSpots == null || touchedSpots.length < 2) {
      return null;
    }

    final int day = touchedSpots[0].x.truncate();
    final String dayText = Covid19PlotBottomSideTitles.parseDateToReadable(day);
    final TextStyle dayStyle = TextStyle(
      color: Colors.black,
      fontSize: 14,
    );

    final String percentageText = "${touchedSpots[1].y}%";
    final TextStyle percentageStyle = dayStyle.copyWith(
      fontWeight: FontWeight.bold
    );

    return [
      LineTooltipItem(dayText, dayStyle),
      LineTooltipItem(percentageText, percentageStyle),
    ];
  }
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
            return "${value?.toInt()}";
          },
        );
}

class Covid19PlotBottomSideTitles extends SideTitles {
  Covid19PlotBottomSideTitles(
      {@required Map<int, double> days, @required StatisticsFilter filter})
      : super(
          rotateAngle: filter == StatisticsFilter.all ? 45 : null,
          showTitles: true,
          textStyle: TextStyles.statisticsPlotLabel(),
          margin: 14,
          reservedSize: 10,
          getTitles: (double value) {
            int currentDay = value.truncate();

            switch (filter) {
              case StatisticsFilter.last7:
                return parseDateToReadable(currentDay);
                break;
              case StatisticsFilter.last30:
                if (isSunday(currentDay)) {
                  return parseDateToReadable(currentDay);
                }
                break;
              case StatisticsFilter.all:
                if (currentDay % 30 == 0) {
                  return parseDateToReadable(currentDay);
                }
                break;
              default:
                return "";
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

  static bool isSunday(int value) {
    DateTime day = firstDayOfData.add(
      Duration(
        days: value,
      ),
    );

    return day.weekday == 1;
  }
}

class Covid19PlotLineChartBarData extends LineChartBarData {
  Covid19PlotLineChartBarData(List<FlSpot> spots, StatisticsFilter filter)
      : super(
          spots: spots,
          isCurved: filter != StatisticsFilter.last7,
          colors: <Color>[Covid19Colors.vostBlue],
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            gradientFrom: Offset(1, 1),
            gradientTo: Offset(0.5, 0),
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
          minY: plotData.currentPlotData.minValue,
          maxY: plotData.currentPlotData.maxValue,
          lineBarsData: plotData.lineBarsData(),
          lineTouchData: Covid19LineTouchData(),
          gridData: FlGridData(
              verticalInterval: plotData.filter.intervalValue(),
              horizontalInterval: plotData.currentPlotData.interval,
              drawHorizontalLine: true,
              drawVerticalLine: true,
              show: true,
              getDrawingHorizontalLine: (_) {
                return StandardHorizontalFlLine();
              },
              getDrawingVerticalLine: (_) {
                return StandardVerticalFlLine();
              }),
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
          barGroups: plotData.barsGroupData(),
          barTouchData: Covid19BarTouchData(),
          gridData: FlGridData(
              verticalInterval: plotData.filter.intervalValue(),
              drawHorizontalLine: true,
              drawVerticalLine: true,
              show: true,
              getDrawingHorizontalLine: (_) {
                return StandardHorizontalFlLine();
              },
              getDrawingVerticalLine: (_) {
                return StandardVerticalFlLine();
              }),
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
  Covid19DoubleBarChart(
      {@required List<AgeGroupBySex> ageGroups, @required double interval})
      : super(
          minY: 0,
          barGroups: parseDoubleBar(ageGroups),
          barTouchData: Covid19BarTouchData(),
          gridData: FlGridData(
            verticalInterval: 42, //This value will be updated
            horizontalInterval: interval,
            drawHorizontalLine: true,
            drawVerticalLine: false,
            show: true,
          ),
          titlesData: FlTitlesData(
            leftTitles: Covid19PlotLeftSideTitles(
              interval: interval,
            ),
            bottomTitles: SideTitles(
              textStyle: TextStyles.statisticsPlotLabel(),
              showTitles: true,
              reservedSize: 20,
              getTitles: (value) {
                return ageGroupDescription[value?.toInt()];
              },
            ),
          ),
          borderData: FlBorderData(
            show: false,
            border: Covid19PlotBorder(),
          ),
        );

  static List<BarChartGroupData> parseDoubleBar(List<AgeGroupBySex> ageGroups) {
    List<BarChartGroupData> groupedData = [];

    for (var ageGroup in ageGroups) {
      groupedData.add(
        BarChartGroupData(
          x: ageGroup.order,
          barsSpace: 1,
          barRods: [
            BarChartRodData(
              width: 15,
              borderRadius: BorderRadius.circular(1),
              y: ageGroup.male,
              color: Covid19Colors.vostBlue,
            ),
            BarChartRodData(
              width: 15,
              borderRadius: BorderRadius.circular(1),
              y: ageGroup.female,
              color: Covid19Colors.lightBlue,
            ),
          ],
        ),
      );
    }

    return groupedData;
  }
}

class Covid19BarSymptomsPercentageChart extends BarChartData {
  Covid19BarSymptomsPercentageChart(
    BuildContext context, {
    @required List<SymptomsPercentage> symptomsPercentages,
  }) : super(
          minY: 0,
          maxY: 110,
          barGroups: parseBySymptons(symptomsPercentages),
          barTouchData: Covid19BarTouchData(),
          gridData: FlGridData(
            verticalInterval: 42, //This value will be updated
            horizontalInterval: 20,
            drawHorizontalLine: true,
            drawVerticalLine: false,
            show: true,
          ),
          titlesData: FlTitlesData(
            leftTitles: Covid19PlotLeftSideTitles(
              interval: 25,
            ),
            bottomTitles: SideTitles(
              textStyle: TextStyles.statisticsPlotLabel(),
              showTitles: true,
              reservedSize: 15,
              getTitles: (value) {
                return symptomsPercentages[value?.toInt()]
                    .symptom
                    .label(context);
              },
            ),
          ),
          borderData: FlBorderData(
            show: false,
            border: Covid19PlotBorder(),
          ),
        );

  static List<BarChartGroupData> parseBySymptons(
      List<SymptomsPercentage> symptomsPercentages) {
    List<BarChartGroupData> groupedData = [];

    for (var symptom in symptomsPercentages) {
      groupedData.add(
        BarChartGroupData(x: symptom.order, barsSpace: 4, barRods: [
          BarChartRodData(
            borderRadius: BorderRadius.circular(1),
            y: symptom.percentage.toDouble(),
            color: Covid19Colors.vostBlue,
            width: 30,
          ),
        ]),
      );
    }
    return groupedData;
  }
}
