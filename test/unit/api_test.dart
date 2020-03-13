import 'dart:io';

import 'package:covid19_mobile_triage/model/sample_model.dart';
import 'package:covid19_mobile_triage/services/api_service.dart';
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
    final MockDefaultHttpClientAdapter clientAdapter = MockDefaultHttpClientAdapter();

    setUp(() async {
      when(options.headers).thenReturn({});
      when(client.options).thenReturn(options);
      when(client.httpClientAdapter).thenReturn(clientAdapter);
      when(clientAdapter.onHttpClientCreate).thenReturn((client) => client);
      when(client.post(any, data: anyNamed('data'))).thenAnswer((_) => Future.value(Response(statusCode: HttpStatus.ok)));
      when(client.get(any)).thenAnswer((_) => Future.value(Response(statusCode: HttpStatus.ok)));
      when(client.put(any, data: anyNamed('data'))).thenAnswer((_) => Future.value(Response(statusCode: HttpStatus.ok)));
      when(client.delete(any, data: anyNamed('data'))).thenAnswer((_) => Future.value(Response(statusCode: HttpStatus.ok)));
      api.init(client);
      when(options.headers).thenReturn({});
    });

    test(' performs login with a valid user', () async {
      final Foo fooModel = Foo('teste', 10);

      when(client.post('/path')).thenAnswer((_) => Future.value(Response(statusCode: HttpStatus.ok)));
      await api.getFoo(fooModel);

      verify(
        client.post('/path', data: {
          'someString': fooModel.someString,
          'myInt': fooModel.someInt,
        }),
      ).called(1);
    });
  });
}
