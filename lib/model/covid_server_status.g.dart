// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_server_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidServerStatusModel _$CovidServerStatusModelFromJson(
    Map<String, dynamic> json) {
  return CovidServerStatusModel(
    (json['status'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
  );
}

Map<String, dynamic> _$CovidServerStatusModelToJson(
    CovidServerStatusModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'status', instance.status?.map((k, e) => MapEntry(k.toString(), e)));
  return val;
}
