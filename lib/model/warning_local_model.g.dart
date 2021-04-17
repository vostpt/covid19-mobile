// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarningLocalModel _$WarningLocalModelFromJson(Map<String, dynamic> json) {
  return WarningLocalModel(
    json['local'] as String,
  );
}

Map<String, dynamic> _$WarningLocalModelToJson(WarningLocalModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('local', instance.local);
  return val;
}
