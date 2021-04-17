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
///
abstract class WarningsAbstractApi {
  /// Base API path
  String get baseApi;

  /// Host endpoint
  String get host;

  /// Scheme request format
  String get scheme;

  /// building the path
  String build({String path = ""});
}

class _WarningConfigApi implements WarningsAbstractApi {
  _WarningConfigApi();

  @override
  String get baseApi => '';

  @override
  String get host => 'us-central1-vost-dev-allpurpose.cloudfunctions.net';

  @override
  String get scheme => 'https';

  @override
  String build({String path = ""}) {
    var base = '$scheme://$host/';

    if (path.isNotEmpty) {
      return '$base/$path';
    }

    return base;
  }
}

class WarningsDevApi extends _WarningConfigApi {}

class WarningsProductionApi extends _WarningConfigApi {}
