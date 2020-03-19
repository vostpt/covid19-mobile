
/// Abstract API class
abstract class AbstractApi {

  /// API ex:
  /// https://dev-covid19.vost.pt/wp-json/vost/v1/stats

  /// Scheme request format
  String get scheme;

  /// Host endpoint
  String get host;

  /// Base API path
  String get baseApi;

  /// Base API version
  String get apiVersion;

  /// building the path
  String build({String path = ""});
}

/// API config params
class _ConfigApi implements AbstractApi {
  ///https://dev-covid19.vost.pt/wp-json/vost/v1/stats

  @override
  String get scheme => "https";

  @override
  String get host => "dev-covid19.vost.pt";

  @override
  String get baseApi => "wp-json/vost";

  @override
  String get apiVersion => "v1";

  @override
  String build({String path = ""}) {

    var base = "$scheme://$host/$baseApi/$apiVersion";

    if(path.isNotEmpty) {
      return "$base/$path";
    }

    return base;
  }
}

/// Develop API Configuration
class DevApi extends _ConfigApi {}

/// Production API Configuration
class ProductionApi extends _ConfigApi {

  @override
  String get host => "<replace_for_production>";

}