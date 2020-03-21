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

import 'package:covid19mobile/ui/screens/home/components/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'widget_test_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Widget: Accordion Widget', () {
    testWidgets('has empty text title, should throw an exception',
        (tester) async {
      await tester.pumpWidget(Accordion());
      expect(tester.takeException(), isInstanceOf<AssertionError>());
    });

    testWidgets('has title and children, should render properly with a border',
        (tester) async {
      await tester.pumpWithEnvironment(Accordion(
        title: 'Foo',
        children: <Widget>[Text('Some child')],
      ));

      // Check collapsed (only title is showing) and has border
      expect(find.byType(Accordion), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);

      // Check expanded (is expanded and 2 texts are rendered, both title and content)
      await tester.tap(find.byType(ExpansionTile));
      await tester.pumpAndSettle();
      expect(find.byType(Text), findsNWidgets(2));
    });

    testWidgets('has title and children, should render without a border',
        (tester) async {
      await tester.pumpWithEnvironment(Accordion(
        title: 'Foo',
        withBorder: false,
        children: <Widget>[Text('Some child')],
      ));

      // Check collapsed (only title is showing)
      expect(find.byType(Accordion), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      // Check expanded (is expanded and 2 texts are rendered, both title and content)
      await tester.tap(find.byType(ExpansionTile));
      await tester.pumpAndSettle();
      expect(find.byType(Text), findsNWidgets(2));

      // Check if no decoration is being applied (border)
      expect(find.byType(BoxDecoration), findsNothing);
    });
  });
}
