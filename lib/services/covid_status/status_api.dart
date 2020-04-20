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

abstract class StatusAbstractApi {
  /// Scheme request format
  String get scheme;

  /// Host endpoint
  String get host;

  /// Base API path
  String get baseApi;

  /// building the path
  String build({String path = ""});
}

class _StatusConfigApi implements StatusAbstractApi {
  @override
  String get baseApi => "";

  @override
  String get host => null;

  @override
  String get scheme => null;

  @override
  String build({String path = ""}) {
    var base = "$scheme://$host/$baseApi/";

    if (path.isNotEmpty) {
      return "$base/$path";
    }

    return base;
  }
}

/// Develop API Configuration
class StatusDevApi extends _StatusConfigApi {
  @override
  String get host => "192.168.1.97:8001";

  @override
  String get scheme => "http";

  @override
  String get baseApi => "Requests";
}

/// Production API Configuration
class StatusProductionApi extends _StatusConfigApi {
  @override
  String get host => "";
}
