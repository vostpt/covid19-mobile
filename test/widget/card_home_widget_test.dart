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

import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/home/components/card_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'widget_test_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Widget: Card Home Widget', () {

    testWidgets('Card Home with background', (tester) async {

          await tester.pumpWithEnvironment(
              CardHome(
                text: "text",
                callback: () => {},
                backgroundColor: Covid19Colors.green,
                textColor: Covid19Colors.white,
              )
          );

          // Check normal with no border
          expect(find.byType(CardHome), findsOneWidget);
          expect(find.byType(Text), findsOneWidget);
          expect(find.byType(ContinuousRectangleBorder), findsNothing);

          final CardHome cardHome = tester.firstWidget(find.byType(CardHome));
          expect(cardHome.borderColor, Colors.transparent);
          expect(cardHome.backgroundColor, Covid19Colors.green);
          expect(cardHome.textColor, Covid19Colors.white);
          expect(cardHome.text, "text");

    });

    testWidgets('Card Home with no background with border', (tester) async {

      await tester.pumpWithEnvironment(
          CardHome(
            text: "text",
            callback: () => {},
            backgroundColor: Colors.transparent,
            textColor: Covid19Colors.darkGrey,
            borderColor: Covid19Colors.lightGrey,
          )
      );

      // Check normal with no border
      expect(find.byType(CardHome), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      // Finds Card widget
      Card actualBox = tester.firstWidget(find.byType(Card));

      // Finds ContinuousRectangleBorder
      ContinuousRectangleBorder shapeBorder = actualBox.shape as ContinuousRectangleBorder;
      expect(shapeBorder.side.color, Covid19Colors.lightGrey);
      expect(shapeBorder.side.width, 2.0);

      expect(shapeBorder.borderRadius, BorderRadius.circular(4.0));

      final CardHome cardHome = tester.firstWidget(find.byType(CardHome));
      expect(cardHome.borderColor, Covid19Colors.lightGrey);
      expect(cardHome.backgroundColor, Colors.transparent);
      expect(cardHome.textColor, Covid19Colors.darkGrey);
      expect(cardHome.text, "text");

    });
  });
}