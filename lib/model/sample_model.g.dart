// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Foo _$FooFromJson(Map<String, dynamic> json) {
  return Foo(
    json['someString'] as String,
    json['myInt'] as int,
  );
}

Map<String, dynamic> _$FooToJson(Foo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('someString', instance.someString);
  writeNotNull('myInt', instance.someInt);
  return val;
}
