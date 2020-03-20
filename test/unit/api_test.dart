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

    test(' performs login with a valid user', () async {
      final Foo fooModel = Foo('teste', 10);

      when(client.post('/path'))
          .thenAnswer((_) => Future.value(Response(statusCode: HttpStatus.ok)));
      await api.getFoo(fooModel);

      verify(
        client.post('/path', data: {
          'someString': fooModel.someString,
          'myInt': fooModel.someInt,
        }),
      ).called(1);
    });

    test(' performs a get stats', () async {
      final statsModel = StatsModel(
          "10", "1", "1", "5", "3"
      );

      when(client.get('/stats'))
          .thenAnswer((_) => Future.value(
          Response(
              statusCode: HttpStatus.ok,
              data: {
                "recuperados": "10",
                "confirmados": "1",
                "suspeitos": "1",
                "aguardar_resultados": "5",
                "obitos": "3"
              }
          )));

      /// Verify if is same instance
      var response = await api.getStats();
      expect(response, isInstanceOf<APIResponse>());

      /// Verify json to model
      var responseModel = StatsModel.fromJson(response.data);
      expect(responseModel, isNotNull);

      /// verify model to json
      var responseModelToJson = responseModel.toJson();
      expect(responseModelToJson, isNotNull);

      /// call api
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

      final statsModel = RemoteWorkModel(
          "escolas",
          "",
          "",
          ""
      );

      when(client.get(postType.getRequestType()))
          .thenAnswer((_) => Future.value(
          Response(
              statusCode: HttpStatus.ok,
              data: {
                "tipo": "escolas",
                "formacao_em_portugues": "",
                "como_aceder": "",
                "suporte_tecnico": "",
              }
          )));

      /// Verify if is same instance
      var response = await api.getPosts<RemoteWorkModel>(postType);
      expect(response, isInstanceOf<APIResponse>());

      expect(response.data, isNotNull);

      /// call api
      verify(
        client.get(postType.getRequestType()),
      ).called(1);


    });
  });
}
