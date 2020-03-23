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

import 'package:covid19mobile/model/remote_work_model.dart';
import 'package:covid19mobile/model/slider_model.dart';
import 'package:covid19mobile/model/stats_model.dart';
import 'package:covid19mobile/model/faq_model.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Models Test', () {
    test(' Stats Model', () async {
      /// Create model
      final statsModel = StatsModel("10", "1", "1", "5", "3", "5 Fev");

      /// Validate properties
      expect(statsModel.recovered, "10");
      expect(statsModel.confirmed, "1");
      expect(statsModel.suspected, "1");
      expect(statsModel.awaitingResults, "5");
      expect(statsModel.deaths, "3");
      expect(statsModel.lastUpdated, "5 Fev");

      /// Check Model instance and type
      expect(statsModel, isNotNull);
      expect(statsModel, isInstanceOf<StatsModel>());

      /// Validate Model instance to Json
      var toJson = statsModel.toJson();
      expect(toJson, isNotNull);
      expect(toJson, isInstanceOf<Map<String, dynamic>>());

      /// Create from json
      var json = {
        "recuperados": "10",
        "confirmados": "1",
        "suspeitos": "1",
        "aguardar_resultados": "5",
        "obitos": "3"
      };
      final model = StatsModel.fromJson(json);
      expect(model, isNotNull);
      expect(model, isInstanceOf<StatsModel>());
    });

    test(' Measures Model', () async {
      /// TODO: add model tests
    });

    test(' RemoteWork Model', () async {
      /// Create model
      final model = RemoteWorkModel(
        10,
        "title",
        "escolas",
        "some description",
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
      expect(model.postTitle, "title");
      expect(model.remoteWorkType, "escolas");
      expect(model.description, "some description");
      expect(model.trainingInPortuguese, "");
      expect(model.howToAccess, "");
      expect(model.technicalSupportUri, "");

      /// Check Model instance and type
      expect(model, isNotNull);
      expect(model, isInstanceOf<RemoteWorkModel>());

      /// Validate Model instance to Json
      var toJson = model.toJson();
      expect(toJson, isNotNull);
      expect(toJson, isInstanceOf<Map<String, dynamic>>());

      /// Create from json
      final json = {
        "ID": 10,
        "post_title": "title",
        "tipo": "escolas",
        "descricao": "some description",
        "formacao_em_portugues": "",
        "como_aceder": "",
        "suporte_tecnico": "",
      };
      final model2 = RemoteWorkModel.fromJson(json);
      expect(model2, isNotNull);
      expect(model2, isInstanceOf<RemoteWorkModel>());
    });

    test(' Faqs Model', () async {
      /// Create model
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

      /// Validate properties
      expect(model.id, 10);
      expect(model.question, "pergunta");
      expect(model.answer, "questao");
      expect(model.responsableEntity, "infarmed");

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
        "entidade_responsavel": "infarmed",
      };
      final model2 = FaqModel.fromJson(json);
      expect(model2, isNotNull);
      expect(model2, isInstanceOf<FaqModel>());
    });

    test(' Slider Model', () async {
      /// Create model
      final model = SliderModel(
          url:
              "https://covid19estamoson.gov.pt/estado-de-emergencia-nacional/pacote-de-medidas/",
          image:
              "https://covid19estamoson.gov.pt/wp-content/uploads/2020/03/pacote-medidas-emergencia-nacional-estamoson.png",
          order: 10);

      expect(model.url,
          "https://covid19estamoson.gov.pt/estado-de-emergencia-nacional/pacote-de-medidas/");
      expect(model.image,
          "https://covid19estamoson.gov.pt/wp-content/uploads/2020/03/pacote-medidas-emergencia-nacional-estamoson.png");
      expect(model.order, 10);
    });
  });
}
