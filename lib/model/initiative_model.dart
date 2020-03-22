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

import 'base_post_model.dart';

part 'initiative_model.g.dart';

/// Initiative Model
///
@JsonSerializable(includeIfNull: false)
class InitiativeModel extends BasePostModel {

  /// Title
  @JsonKey(name: 'title')
  final RenderedContentModel title;

  /// Content
  @JsonKey(name: 'content')
  final RenderedContentModel content;

  /// Constructor
  ///
  /// All Fields are mandatory
  ///
  InitiativeModel(
    int id,
    this.title,
    this.content,
    String author,
    String date,
    String postDateGmt,
    String postExcerpt,
    String postStatus,
    String commentStatus,
    String pingStatus,
    String postPassword,
    String postName,
    String toPing,
    String pinged,
    String postModified,
    String postModifiedGMT,
    String postContentFiltered,
    int postParent,
    String guid,
    int menuOrder,
    String postType,
    String postMimeType,
    String commentCount,
    String filter,
  ) : super(
          id: id,
          author: author,
          date: date,
          postDateGmt: postDateGmt,
          postExcerpt: postExcerpt,
          postStatus: postStatus,
          commentStatus: commentStatus,
          pingStatus: pingStatus,
          postPassword: postPassword,
          postName: postName,
          toPing: toPing,
          pinged: pinged,
          postModified: postModified,
          postModifiedGMT: postModifiedGMT,
          postContentFiltered: postContentFiltered,
          postParent: postParent,
          guid: guid,
          menuOrder: menuOrder,
          postType: postType,
          postMimeType: postMimeType,
          commentCount: commentCount,
          filter: filter,
        );

  /// Mapper from Json to Model
  factory InitiativeModel.fromJson(Map<String, dynamic> json) =>
      _$InitiativeModelFromJson(json);

  /// Maps Model to Json
  Map<String, dynamic> toJson() => _$InitiativeModelToJson(this);
}

@JsonSerializable(includeIfNull: false)
class RenderedContentModel {

  String rendered;

  RenderedContentModel({this.rendered});

  /// Mapper from Json to Model
  factory RenderedContentModel.fromJson(Map<String, dynamic> json) =>
      _$RenderedContentModelFromJson(json);

  /// Maps Model to Json
  Map<String, dynamic> toJson() => _$RenderedContentModelToJson(this);

}