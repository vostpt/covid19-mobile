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
