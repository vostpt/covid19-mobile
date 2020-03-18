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


import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/resources/constants.dart';
import 'package:dio/dio.dart';
import 'package:covid19mobile/ui/app.dart';

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
            : null {
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
