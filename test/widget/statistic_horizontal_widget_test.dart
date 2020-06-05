///     This program is free software: you can redistribute it and/or modify
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

import 'package:covid19mobile/bloc/app_bloc.dart';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/model/covid_status_model.dart';
import 'package:covid19mobile/providers/covid_status_provider.dart';
import 'package:covid19mobile/ui/screens/statistics/components/number_and_percentage.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_horizontal.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_title.dart';
import 'package:covid19mobile/ui/screens/statistics/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_test_utils.dart';

class MockAppBloc extends AppBloc {
  @override
  void getCovidStatus() {
    return null;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final key = GlobalKey();
  final AppBloc appBloc = MockAppBloc();
  final CovidStatusProvider covidStatusProvider = CovidStatusProvider();

  Widget page;
  BuildContext _context;

  group('Widget: Statisctic Main Page Widget', () {
    setUp(() {
      /// Setup Widgets
      page = Builder(
        key: key,
        builder: (context) {
          _context = context;
          return StatisticsPage();
        },
      );

      final c = CovidStatusModel(
        {
          0: "26-02-2020",
          1: "26-02-2020",
        },
        {0: "26-02-2020 00:00", 1: "26-02-2020 00:00"},
        {0: 22000, 1: 22000},
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
        {
          0: 23000,
        },
      );

      covidStatusProvider.setCovidStatus(c);
    });

    void _validateStatisticsTitleWidget(
        tester, Widget widget, String textToValidate) {
      var statisticsTitleFinder = find.descendant(
          of: find.byWidget(widget),
          matching:
              find.byWidgetPredicate((widget) => widget is StatisticsTitle));

      final StatisticsTitle statisticsTitle =
          tester.widget(statisticsTitleFinder);
      var textFinder = find.descendant(
          of: find.byWidget(statisticsTitle),
          matching: find.byWidgetPredicate((widget) => widget is Text));

      final Text text = tester.widget(textFinder);
      expect(text.data, textToValidate);
    }

    void _validateNumberAndPercentageWidgetWidget(
        tester, Widget widget, int value) {
      var numberAndPercentageWidgetFinder = find.descendant(
          of: find.byWidget(widget),
          matching: find.byWidgetPredicate(
              (widget) => widget is NumberAndPercentageWidget));

      final NumberAndPercentageWidget numberAndPercentageWidget =
          tester.widget(numberAndPercentageWidgetFinder);

      expect(numberAndPercentageWidget.value, value);
      expect(numberAndPercentageWidget.percentage, 0.0);
      expect(numberAndPercentageWidget.shouldWrapContent, false);
    }

    void _validateStatisticsHorizontalWidget(
        tester, List<Widget> widgets, int index, String textToValidate) {
      final StatisticHorizontalWidget firstWidget = widgets[index];

      /// Test [StatisticsTitle] Widget
      _validateStatisticsTitleWidget(tester, firstWidget, textToValidate);

      _validateNumberAndPercentageWidgetWidget(tester, firstWidget, 22000);
    }

    testWidgets('Stats Main Widget', (tester) async {
      /// TODO: validate to test in different screen sizes
      //tester.binding.window.physicalSizeTestValue = Size(475, 800);

      await tester.pumpMainProviderWithEnvironment<CovidStatusProvider>(
          page, appBloc, covidStatusProvider);
      await tester.pumpAndSettle();

      expect(find.byType(StatisticsPage), findsOneWidget);
    });

    testWidgets('Stats Main Widget - StatisticsHorizontalWidget',
        (tester) async {
      await tester.pumpMainProviderWithEnvironment<CovidStatusProvider>(
          page, appBloc, covidStatusProvider);
      await tester.pumpAndSettle();

      expect(find.byType(StatisticsPage), findsOneWidget);

      List<StatisticHorizontalWidget> widgets = tester
          .widgetList<StatisticHorizontalWidget>(
              find.byType(StatisticHorizontalWidget))
          .toList();

      expect(find.byType(StatisticHorizontalWidget), findsNWidgets(2));

      _validateStatisticsHorizontalWidget(
          tester, widgets, 0, S.of(_context).statisticsPageConfirmed);
    });
  });
}
