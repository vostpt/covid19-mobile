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

import 'package:covid19mobile/model/faq_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Models Test', () {



    test(' Faqs Model', () async {

      /// Create model
      final model = FaqModel(
        10,
        "pergunta",
        "questao",
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

      /// Validate properties
      expect(model.id, 10);
      expect(model.question, "pergunta");
      expect(model.answer, "questao");

      /// Check Model instance and type
      expect(model, isNotNull);
      expect(model, isInstanceOf<FaqModel>());

      /// Validate Model instance to Json
      var toJson = model.toJson();
      expect(toJson, isNotNull);
      expect(toJson, isInstanceOf<Map<String, dynamic>>());

      /// Create from json
      final json = {
        "ID": 10,
        "question": "pergunta",
        "answer": "questao",
      };
      final model2 = FaqModel.fromJson(json);
      expect(model2, isNotNull);
      expect(model2, isInstanceOf<FaqModel>());

    });

  });

}