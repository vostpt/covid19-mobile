/*
 * © copyright 2019, The Roberto Giori Company
 *
 * Information strictly confidential and exclusive property of The Roberto Giory Company
 * Any copy, distribution or use is strictly prohibited, unless as otherwise expressly approved by The Roberto Giory Company
 */

import 'package:covid19_mobile/generated/l10n.dart';
import 'package:covid19_mobile/resources/constants.dart';
import 'package:dio/dio.dart';
import 'package:covid19_mobile/ui/app.dart';

class APIResponse {
  static final _tag = BUNDLE + '.APIResponse';
  dynamic data;
  Headers headers;
  DioErrorType dioErrorType;
  int statusCode;
  List<int> errors;

  List<String> errorsDescription(S intl) {
    Map<int, String> errorsMap = {
      1234: 'someError',
    };

    return errors
        .map((id) => errorsMap[id] != null ? errorsMap[id] : intl.defaultError)
        .toList();
  }

  APIResponse(this.data, this.statusCode, {this.headers, this.dioErrorType})
      : errors = headers != null && headers['errorKey'] != null
            ? [] // Decode errors to [errors]
            : [] {
    logger.i(this);
  }

  bool get isOk =>
      dioErrorType == null &&
      errors == null &&
      statusCode >= 200 &&
      statusCode < 400;

  bool get isNotOk => !isOk;

  @override
  String toString() =>
      '[$_tag] Code: $statusCode | Body: $data | Headers: $headers | Error: $dioErrorType';
}
