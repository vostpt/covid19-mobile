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
import 'package:covid19mobile/model/sample_model.dart';
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
        id: "269",
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

      /// Verify if is same instance
      var response = await api.getMeasures();
      expect(response, isInstanceOf<APIResponse>());

      /// Verify json to model
      var responseModel = MeasuresModel.fromJson(response.data);
      expect(responseModel, isNotNull);

      /// Verify model to json
      var responseModeltoJson = responseModel.toJson();
      expect(responseModeltoJson, isNotNull);

      /// Call API
      verify(
        client.get('/measures'),
      ).called(1);

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
