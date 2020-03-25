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
///    along with this program.  If not, see <https://www.gnu.org/licenses/>./import 'package:covid19mobile/bloc/app_bloc.dart';

import 'package:covid19mobile/model/faq_model.dart';
import 'package:covid19mobile/providers/faq_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../widget/widget_test_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Widget: Faq Accordion Widget', () {
    testFaqWidgetWithMultiProvider(WidgetTester tester) async {
      final key = GlobalKey();

      final notifier = FaqProvider();

      await tester.pumpWithEnvironment(MultiProvider(
        providers: [ChangeNotifierProvider<FaqProvider>.value(value: notifier)],
        child: Builder(builder: (context) {
          var p = Provider.of<FaqProvider>(context);

          if (p.faqs != null) {
            expect(p, notifier);
            expect(p.faqs, isNotNull);
          }

          return MediaQuery(
            key: key,
            data: MediaQueryData(),
            child: Text(
              "faq: ${p.faqs}",
            ),
          );
        }),
      ));

      await tester.pump();

      // adding to stream is asynchronous so we have to delay the pump
      await Future.microtask(tester.pump);

      var p = Provider.of<FaqProvider>(key.currentContext, listen: false);
      expect(p, notifier);
      expect(p.faqs, isEmpty);

      List<FaqModel> faqs = [];
      final model = FaqModel(
        10,
        "pergunta",
        "questao",
        "infarmed",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        1,
        "",
        1,
        "",
        "",
        "",
        "",
      );
      faqs.add(model);

      p.setFaqs(
        {0: faqs},
      );
      expect(p, notifier);
      expect(p.faqs, isNotNull);
      expect(p.faqs[0], faqs);
      expect(p.faqs.length, 1);
    }

    testWidgets('Faq Page with MultiProvider', testFaqWidgetWithMultiProvider);
  });
}
