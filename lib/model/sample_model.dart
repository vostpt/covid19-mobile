import 'package:json_annotation/json_annotation.dart';

part 'sample_model.g.dart';

/// This is a place holder model just to demonstrate the use of json_serializable.
/// Delete as soon as you create a real one.

@JsonSerializable(includeIfNull: false)
class Foo {
  Foo(this.someString, this.someInt);

  final String someString;

  @JsonKey(name: 'myInt')
  final int someInt;

  factory Foo.fromJson(Map<String, dynamic> json) => _$FooFromJson(json);
  Map<String, dynamic> toJson() => _$FooToJson(this);
}
