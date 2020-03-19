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

import 'dart:io';

import 'package:covid19mobile/model/api_response_model.dart';
import 'package:covid19mobile/model/measures_model.dart';
import 'package:covid19mobile/model/stats_model.dart';
import 'package:covid19mobile/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('API Service Test', () {
    final APIService api = APIService.api;
    final MockDio client = MockDio();
    final MockBaseOptions options = MockBaseOptions();
    final MockDefaultHttpClientAdapter clientAdapter =
        MockDefaultHttpClientAdapter();

    setUp(() async {
      when(options.headers).thenReturn({});
      when(client.options).thenReturn(options);
      when(client.httpClientAdapter).thenReturn(clientAdapter);
      when(clientAdapter.onHttpClientCreate).thenReturn((client) => client);
      when(client.post(any, data: anyNamed('data')))
          .thenAnswer((_) => Future.value(Response(statusCode: HttpStatus.ok)));
      when(client.get(any))
          .thenAnswer((_) => Future.value(Response(statusCode: HttpStatus.ok)));
      when(client.put(any, data: anyNamed('data')))
          .thenAnswer((_) => Future.value(Response(statusCode: HttpStatus.ok)));
      when(client.delete(any, data: anyNamed('data')))
          .thenAnswer((_) => Future.value(Response(statusCode: HttpStatus.ok)));

      api.init(client);

      when(options.headers).thenReturn({});
    });

    test(' performs a get stats', () async {
      final statsModel = StatsModel("10", "1", "1", "5", "3");

      when(client.get('/stats')).thenAnswer(
          (_) => Future.value(Response(statusCode: HttpStatus.ok, data: {
                "recuperados": "10",
                "confirmados": "1",
                "suspeitos": "1",
                "aguardar_resultados": "5",
                "obitos": "3"
              })));

      /// Verify if is same instance
      var response = await api.getStats();
      expect(response, isInstanceOf<APIResponse>());

      /// Verify json to model
      var responseModel = StatsModel.fromJson(response.data);
      expect(responseModel, isNotNull);

      /// Verify model to json
      var responseModelToJson = responseModel.toJson();
      expect(responseModelToJson, isNotNull);

      /// Call API
      verify(
        client.get('/stats'),
      ).called(1);

      /// verify model data
      expect(responseModel.recovered, statsModel.recovered);
      expect(responseModel.confirmed, statsModel.confirmed);
      expect(responseModel.awaitingResults, statsModel.awaitingResults);
      expect(responseModel.suspected, statsModel.suspected);
      expect(responseModel.deaths, statsModel.deaths);
    });

    test(' performs a get measures', () async {
      final measuresModel = MeasuresModel(
        id: 269,
        author: "18",
        date: "2020-03-18 00:52:14",
        postDateGmt: "2020-03-18 00:52:14",
        postContent:
            "<span style=\"font-weight: 400;\">Já foram aprovadas importantes medidas em Conselho de Ministros para apoiar empresas, associações, cooperativas e profissionais independentes. Toda a informação sobre estas medidas está disponível neste site. </span>\r\n\r\n<span style=\"font-weight: 400;\">Estamos a trabalhar para identificar e concretiza mais medidas de apoio às entidades de criação artísticas, aos artistas e aos técnicos.</span>\r\n\r\n<span style=\"font-weight: 400;\">Está disponível a conta de email </span><a href=\"mailto:cultura.covid19@mc.gov.pt\"><b>cultura.covid19@mc.gov.pt</b></a><span style=\"font-weight: 400;\"> para dar reposta às dúvidas do setor sobre todas as medidas de apoio.</span>",
        postTitle: "Medidas extraordinárias de apoio às Artes",
        postExcerpt: "",
        postStatus: "publish",
        commentStatus: "closed",
        pingStatus: "closed",
        postPassword: "",
        postName: "medidas-extraordinaras-de-apoio-as-artes",
        toPing: "",
        pinged: "",
        postModified: "2020-03-19 15:08:09",
        postModifiedGMT: "2020-03-19 15:08:09",
        postContentFiltered: "",
        postParent: 0,
        guid: "https://dev-covid19.vost.pt/?post_type=measure&#038;p=269",
        menuOrder: 0,
        postType: "measure",
        postMimeType: "",
        commentCount: "0",
        filter: "raw",
        documents: false,
        links: false,
      );

      when(client.get('/measures')).thenAnswer(
        (_) => Future.value(
          (Response(statusCode: HttpStatus.ok, data: [
            {
              "ID": 269,
              "post_author": "18",
              "post_date": "2020-03-18 00:52:14",
              "post_date_gmt": "2020-03-18 00:52:14",
              "post_content":
                  "<span style=\"font-weight: 400;\">J\u00e1 foram aprovadas importantes medidas em Conselho de Ministros para apoiar empresas, associa\u00e7\u00f5es, cooperativas e profissionais independentes. Toda a informa\u00e7\u00e3o sobre estas medidas est\u00e1 dispon\u00edvel neste site.\u00a0<\/span>\r\n\r\n<span style=\"font-weight: 400;\">Estamos a trabalhar para identificar e concretiza mais medidas de apoio \u00e0s entidades de cria\u00e7\u00e3o art\u00edsticas, aos artistas e aos t\u00e9cnicos.<\/span>\r\n\r\n<span style=\"font-weight: 400;\">Est\u00e1 dispon\u00edvel a conta de email <\/span><a href=\"mailto:cultura.covid19@mc.gov.pt\"><b>cultura.covid19@mc.gov.pt<\/b><\/a><span style=\"font-weight: 400;\"> para dar reposta \u00e0s d\u00favidas do setor sobre todas as medidas de apoio.<\/span>",
              "post_title":
                  "Medidas extraordin\u00e1rias de apoio \u00e0s Artes",
              "post_excerpt": "",
              "post_status": "publish",
              "comment_status": "closed",
              "ping_status": "closed",
              "post_password": "",
              "post_name": "medidas-extraordinaras-de-apoio-as-artes",
              "to_ping": "",
              "pinged": "",
              "post_modified": "2020-03-19 15:08:09",
              "post_modified_gmt": "2020-03-19 15:08:09",
              "post_content_filtered": "",
              "post_parent": 0,
              "guid":
                  "https:\/\/dev-covid19.vost.pt\/?post_type=measure&#038;p=269",
              "menu_order": 0,
              "post_type": "measure",
              "post_mime_type": "",
              "comment_count": "0",
              "filter": "raw",
              "documentos": false,
              "links": false
            },
            {
              "ID": 270,
              "post_author": "9",
              "post_date": "2020-03-18 00:51:16",
              "post_date_gmt": "2020-03-18 00:51:16",
              "post_content":
                  "<b>Medidas de apoio no \u00e2mbito do Programa Mar 2020<\/b>\r\n\r\n<span style=\"font-weight: 400;\">Tendo em vista minimizar os impactos econ\u00f3mico-financeiros da situa\u00e7\u00e3o epidemiol\u00f3gica do novo coronav\u00edrus \u2013 Covid-19, o Minist\u00e9rio do Mar adotou um conjunto de medidas excecionais de apoio \u00e0s empresas e outras entidades benefici\u00e1rias do Programa Operacional Mar 2020.<\/span>\r\n<ul>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">De modo a agilizar a realiza\u00e7\u00e3o de pagamentos, foram adotadas as seguintes medidas excecionais:<\/span><\/li>\r\n<\/ul>\r\n<ol>\r\n \t<li style=\"list-style-type: none;\">\r\n<ol>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Sempre que, por motivos n\u00e3o imput\u00e1veis \u00e0s empresas e demais entidades privadas benefici\u00e1rias do programa, n\u00e3o seja poss\u00edvel a valida\u00e7\u00e3o do pedido de pagamento, no prazo de 20 dias \u00fateis contados da data da respetiva submiss\u00e3o pelo benefici\u00e1rio, o pedido \u00e9 liquidado a t\u00edtulo de adiantamento;<\/span><\/li>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Os pedidos de pagamento validados nos termos da al\u00ednea anterior s\u00e3o pagos at\u00e9 ao valor m\u00e1ximo de 70% do apoio p\u00fablico que lhe corresponda, com periodicidade semanal;<\/span><\/li>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Passa a ser poss\u00edvel aos benefici\u00e1rios do programa submeter pedidos de pagamento com base em despesa faturada, mas ainda n\u00e3o paga pelo benefici\u00e1rio, sendo esta considerada para pagamento a t\u00edtulo de adiantamento, desde que a soma dos adiantamentos j\u00e1 realizados e n\u00e3o justificados com despesa submetida e validada n\u00e3o ultrapasse os 50% da despesa p\u00fablica aprovada para cada projeto;<\/span><\/li>\r\n<\/ol>\r\n<\/li>\r\n<\/ol>\r\n&nbsp;\r\n<ul>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">S\u00e3o eleg\u00edveis para reembolso as despesas comprovadamente suportadas pelos benefici\u00e1rios em iniciativas ou a\u00e7\u00f5es canceladas ou adiadas por raz\u00f5es relacionadas com o COVID-19, previstas em projetos aprovados.<\/span><\/li>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Em complemento ao referido no ponto anterior, n\u00e3o s\u00e3o penalizados os projetos que, devido aos impactos negativos decorrentes do COVID-19, n\u00e3o atinjam o or\u00e7amento aprovado e a plena execu\u00e7\u00e3o financeira prevista na concretiza\u00e7\u00e3o de a\u00e7\u00f5es ou metas, podendo ser encerrados como conclu\u00eddos desde que n\u00e3o ponham em causa o alcance dos objetivos para os quais a opera\u00e7\u00e3o foi aprovada.<\/span><\/li>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Sempre que necess\u00e1rio, quando o prazo contratualmente definido para a conclus\u00e3o do projeto tiver por refer\u00eancia o ano de 2020, esta data \u00e9 objeto de alargamento, para 2021 e em prazo compat\u00edvel com a finaliza\u00e7\u00e3o da sua execu\u00e7\u00e3o f\u00edsico-financeira.<\/span><\/li>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">\u00c9 autorizada a apresenta\u00e7\u00e3o de um maior n\u00famero de pedidos de pagamento, para al\u00e9m do limite estabelecido na medida de flexibiliza\u00e7\u00e3o j\u00e1 adotada em finais de 2019, que permite a submiss\u00e3o de at\u00e9 10 pedidos de pagamento em cada projeto.<\/span><\/li>\r\n<\/ul>",
              "post_title":
                  "Medidas de apoio no \u00e2mbito do Programa Mar 2020",
              "post_excerpt": "",
              "post_status": "publish",
              "comment_status": "closed",
              "ping_status": "closed",
              "post_password": "",
              "post_name": "medidas-de-apoio-no-ambito-do-programa-mar-2020",
              "to_ping": "",
              "pinged": "",
              "post_modified": "2020-03-19 15:08:20",
              "post_modified_gmt": "2020-03-19 15:08:20",
              "post_content_filtered": "",
              "post_parent": 0,
              "guid":
                  "https:\/\/dev-covid19.vost.pt\/?post_type=measure&#038;p=270",
              "menu_order": 0,
              "post_type": "measure",
              "post_mime_type": "",
              "comment_count": "0",
              "filter": "raw",
              "documentos": false,
              "links": false
            }
          ])),
        ),
      );

      /// Verify if is same instance
      var response = await api.getMeasures();
      expect(response, isInstanceOf<APIResponse>());

      /// Verify json to model
      var listResponseModel = MeasuresModel.fromJson(response.data);
      expect(listResponseModel, isNotNull);
      expect(listResponseModel, isInstanceOf<List>());
      expect(listResponseModel.length, 2);

      /// Verify model to json
      var responseModeltoJson =
          listResponseModel.map((model) => model.toJson());
      expect(responseModeltoJson, isNotNull);

      /// Call API
      verify(
        client.get('/measures'),
      ).called(1);

      var responseModel = listResponseModel.first;

      expect(responseModel.id, measuresModel.id);
      expect(responseModel.author, measuresModel.author);
      expect(responseModel.date, measuresModel.date);
      expect(responseModel.postDateGmt, measuresModel.postDateGmt);
      expect(responseModel.postContent, measuresModel.postContent);
      expect(responseModel.postTitle, measuresModel.postTitle);
      expect(responseModel.postExcerpt, measuresModel.postExcerpt);
      expect(responseModel.postStatus, measuresModel.postStatus);
      expect(responseModel.commentStatus, measuresModel.commentStatus);
      expect(responseModel.pingStatus, measuresModel.pingStatus);
      expect(responseModel.postPassword, measuresModel.postPassword);
      expect(responseModel.postName, measuresModel.postName);
      expect(responseModel.toPing, measuresModel.toPing);
      expect(responseModel.pinged, measuresModel.pinged);
      expect(responseModel.postModified, measuresModel.postModified);
      expect(responseModel.postModifiedGMT, measuresModel.postModifiedGMT);
      expect(
          responseModel.postContentFiltered, measuresModel.postContentFiltered);
      expect(responseModel.postParent, measuresModel.postParent);
      expect(responseModel.guid, measuresModel.guid);
      expect(responseModel.menuOrder, measuresModel.menuOrder);
      expect(responseModel.postType, measuresModel.postType);
      expect(responseModel.postMimeType, measuresModel.postMimeType);
      expect(responseModel.commentCount, measuresModel.commentCount);
      expect(responseModel.filter, measuresModel.filter);
      expect(responseModel.documents, measuresModel.documents);
      expect(responseModel.links, measuresModel.links);
    });
  });
}
