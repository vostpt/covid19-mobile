// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsModel _$StatsModelFromJson(Map<String, dynamic> json) {
  return StatsModel(
    json['recuperados'] as String,
    json['confirmados'] as String,
    json['suspeitos'] as String,
    json['aguardar_resultados'] as String,
    json['obitos'] as String,
    json['data_atualizacao'] as String,
  );
}

Map<String, dynamic> _$StatsModelToJson(StatsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('recuperados', instance.recovered);
  writeNotNull('confirmados', instance.confirmed);
  writeNotNull('suspeitos', instance.suspected);
  writeNotNull('aguardar_resultados', instance.awaitingResults);
  writeNotNull('obitos', instance.deaths);
  writeNotNull('data_atualizacao', instance.lastUpdated);
  return val;
}
