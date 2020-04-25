///    This program is free software: you can redistribute it and/or modify
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

import 'package:covid19mobile/main_common.dart';
import 'package:covid19mobile/model/api_response_model.dart';
import 'package:covid19mobile/services/covid_status/status_api.dart';
import 'package:covid19mobile/services/request_type.dart';
import 'package:covid19mobile/ui/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Main APIService for Status endpoint
///
/// This will create a singleton instance
///
class CovidStatusAPIService {
  static bool _initialized = false;
  static const String _tag = '.StatusAPIService';
  static CovidStatusAPIService _apiService = CovidStatusAPIService._();
  static Dio _client;
  static StatusAbstractApi _configApi;

  bool get _notInitialized => !_initialized;

  static CovidStatusAPIService get api => _apiService;

  CovidStatusAPIService._();

  @visibleForTesting
  set setMockInstance(CovidStatusAPIService instance) => _apiService = instance;

  void initialize([Dio client, StatusAbstractApi api]) async {
    if (_notInitialized) {
      _configApi = api ??
          (appConfig == AppConfig.dev ? StatusDevApi() : StatusProductionApi());

      _client = client ?? Dio();
      _client.options.baseUrl = _configApi.build();
      _client.options.connectTimeout = 5000;
      _initialized = true;
    }
  }

  Future<APIResponse> _performRequest(
    RequestType type,
    String resource, {
    Map<String, dynamic> headers = const {"accept": "application/json"},
    Map<String, dynamic> queryParams,
    Map<String, dynamic> body,
  }) async {
    if (_notInitialized) {
      initialize();
    }

    Response response;

    logger.i(
        '[$_tag] Requesting:  $resource | QueryParams: $queryParams | Body: $body | Method: ${describeEnum(type)}');

    if (headers != null) {
      _client.options.headers.addAll(headers);
    }

    queryParams?.removeWhere((k, v) => v == null);

    try {
      switch (type) {
        case RequestType.get:
          response = await _client.get(resource, queryParameters: queryParams);
          break;
      }

      return APIResponse(
        response?.data,
        response?.statusCode,
        headers: response?.headers,
      );
    } on DioError catch (e) {
      logger.e(
          '[$_tag] Request error:  ${e.error} | Status Code: ${e.response?.statusCode} | Response: ${e.response} | Request: ${e.request?.uri} | Type: ${e.type} | Headers:${e.response?.headers?.map}');
      return APIResponse(e.response?.data, e.response?.statusCode,
          headers: e.response?.headers, dioErrorType: e?.type);
    }
  }

  Future<APIResponse> getFullDataSet<CovidStatusModel>() async {
    return await _performRequest(
      RequestType.get,
      '/get_full_dataset',
    );
  }
}
