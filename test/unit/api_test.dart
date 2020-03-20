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
import 'package:covid19mobile/model/post_type.dart';
import 'package:covid19mobile/model/remote_work_model.dart';
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
        (_) => Future.value(
          Response(statusCode: HttpStatus.ok, data: {
            "recuperados": "10",
            "confirmados": "1",
            "suspeitos": "1",
            "aguardar_resultados": "5",
            "obitos": "3"
          }),
        ),
      );

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

    test(' performs a get Post RemoteWork', () async {
      final postType = PostType(PostTypes.remoteWork);

      final statsModel = RemoteWorkModel("escolas", "", "", "");

      when(client.get(postType.getRequestType())).thenAnswer(
        (_) => Future.value(
          Response(statusCode: HttpStatus.ok, data: {
            "tipo": "escolas",
            "formacao_em_portugues": "",
            "como_aceder": "",
            "suporte_tecnico": "",
          }),
        ),
      );

      /// Verify if is same instance
      var response = await api.getPosts<RemoteWorkModel>(postType);
      expect(response, isInstanceOf<APIResponse>());

      expect(response.data, isNotNull);

      /// call api
      verify(
        client.get(postType.getRequestType()),
      ).called(1);
    });

    test(' performs a get measures', () async {
      final postType = PostType(PostTypes.measures);

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
        postModified: "2020-03-20 11:15:11",
        postModifiedGMT: "2020-03-20 11:15:11",
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

      when(client.get(postType.getRequestType())).thenAnswer(
        (_) => Future.value(
          Response(statusCode: HttpStatus.ok, data: [
            {
              "ID": 269,
              "post_author": "18",
              "post_date": "2020-03-18 00:52:14",
              "post_date_gmt": "2020-03-18 00:52:14",
              "post_content":
                  "<span style=\"font-weight: 400;\">Já foram aprovadas importantes medidas em Conselho de Ministros para apoiar empresas, associações, cooperativas e profissionais independentes. Toda a informação sobre estas medidas está disponível neste site. </span>\r\n\r\n<span style=\"font-weight: 400;\">Estamos a trabalhar para identificar e concretiza mais medidas de apoio às entidades de criação artísticas, aos artistas e aos técnicos.</span>\r\n\r\n<span style=\"font-weight: 400;\">Está disponível a conta de email </span><a href=\"mailto:cultura.covid19@mc.gov.pt\"><b>cultura.covid19@mc.gov.pt</b></a><span style=\"font-weight: 400;\"> para dar reposta às dúvidas do setor sobre todas as medidas de apoio.</span>",
              "post_title": "Medidas extraordinárias de apoio às Artes",
              "post_excerpt": "",
              "post_status": "publish",
              "comment_status": "closed",
              "ping_status": "closed",
              "post_password": "",
              "post_name": "medidas-extraordinaras-de-apoio-as-artes",
              "to_ping": "",
              "pinged": "",
              "post_modified": "2020-03-20 11:15:11",
              "post_modified_gmt": "2020-03-20 11:15:11",
              "post_content_filtered": "",
              "post_parent": 0,
              "guid":
                  "https://dev-covid19.vost.pt/?post_type=measure&#038;p=269",
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
                  "<b>Medidas de apoio no âmbito do Programa Mar 2020</b>\r\n\r\n<span style=\"font-weight: 400;\">Tendo em vista minimizar os impactos económico-financeiros da situação epidemiológica do novo coronavírus – Covid-19, o Ministério do Mar adotou um conjunto de medidas excecionais de apoio às empresas e outras entidades beneficiárias do Programa Operacional Mar 2020.</span>\r\n<ul>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">De modo a agilizar a realização de pagamentos, foram adotadas as seguintes medidas excecionais:</span></li>\r\n</ul>\r\n<ol>\r\n \t<li style=\"list-style-type: none;\">\r\n<ol>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Sempre que, por motivos não imputáveis às empresas e demais entidades privadas beneficiárias do programa, não seja possível a validação do pedido de pagamento, no prazo de 20 dias úteis contados da data da respetiva submissão pelo beneficiário, o pedido é liquidado a título de adiantamento;</span></li>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Os pedidos de pagamento validados nos termos da alínea anterior são pagos até ao valor máximo de 70% do apoio público que lhe corresponda, com periodicidade semanal;</span></li>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Passa a ser possível aos beneficiários do programa submeter pedidos de pagamento com base em despesa faturada, mas ainda não paga pelo beneficiário, sendo esta considerada para pagamento a título de adiantamento, desde que a soma dos adiantamentos já realizados e não justificados com despesa submetida e validada não ultrapasse os 50% da despesa pública aprovada para cada projeto;</span></li>\r\n</ol>\r\n</li>\r\n</ol>\r\n&nbsp;\r\n<ul>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">São elegíveis para reembolso as despesas comprovadamente suportadas pelos beneficiários em iniciativas ou ações canceladas ou adiadas por razões relacionadas com o COVID-19, previstas em projetos aprovados.</span></li>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Em complemento ao referido no ponto anterior, não são penalizados os projetos que, devido aos impactos negativos decorrentes do COVID-19, não atinjam o orçamento aprovado e a plena execução financeira prevista na concretização de ações ou metas, podendo ser encerrados como concluídos desde que não ponham em causa o alcance dos objetivos para os quais a operação foi aprovada.</span></li>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">Sempre que necessário, quando o prazo contratualmente definido para a conclusão do projeto tiver por referência o ano de 2020, esta data é objeto de alargamento, para 2021 e em prazo compatível com a finalização da sua execução físico-financeira.</span></li>\r\n \t<li style=\"font-weight: 400;\"><span style=\"font-weight: 400;\">É autorizada a apresentação de um maior número de pedidos de pagamento, para além do limite estabelecido na medida de flexibilização já adotada em finais de 2019, que permite a submissão de até 10 pedidos de pagamento em cada projeto.</span></li>\r\n</ul>",
              "post_title": "Medidas de apoio no âmbito do Programa Mar 2020",
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
                  "https://dev-covid19.vost.pt/?post_type=measure&#038;p=270",
              "menu_order": 0,
              "post_type": "measure",
              "post_mime_type": "",
              "comment_count": "0",
              "filter": "raw",
              "documentos": false,
              "links": false
            }
          ]),
        ),
      );

      /// Verify if is same instance
      var response = await api.getPosts<MeasuresModel>(postType);
      expect(response, isInstanceOf<APIResponse>());

      /// Verify json to model
      var listResponseModel = MeasuresModel.fromJson(response.data);
      expect(listResponseModel, isNotNull);
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
