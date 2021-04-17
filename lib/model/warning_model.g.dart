// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarningModel _$WarningModelFromJson(Map<String, dynamic> json) {
  return WarningModel(
    json['tipo'] as String,
    json['inicio'] as String,
    (json['locais'] as List)
        ?.map((e) => e == null
            ? null
            : WarningLocalModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['nivel'] as String,
    json['icon'] as String,
    json['fim'] as String,
  );
}

Map<String, dynamic> _$WarningModelToJson(WarningModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tipo', instance.type);
  writeNotNull('inicio', instance.start);
  writeNotNull('locais', instance.locals);
  writeNotNull('nivel', instance.level);
  writeNotNull('icon', instance.icon);
  writeNotNull('fim', instance.end);
  return val;
}
