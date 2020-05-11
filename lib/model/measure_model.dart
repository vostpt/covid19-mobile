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
import 'package:covid19mobile/model/base_post_model.dart';
import 'package:flutter/src/widgets/framework.dart';

part 'measure_model.g.dart';

/// Measures Model
@JsonSerializable(includeIfNull: false)
class MeasureModel extends BasePostModel {
  /// Content information of this measure
  @JsonKey(name: 'post_content')
  final String postContent;

  /// Title information of this measure
  @JsonKey(name: 'post_title')
  final String postTitle;

  /// If it has documents attached
  @JsonKey(name: 'documentos')
  final bool documents;

  /// If it has links attached
  // @JsonKey(name: 'links')
  // final bool links;

  /// Model constructor
  ///
  /// All properties are mandatory
  ///
  MeasureModel({
    int id,
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
    this.postContent,
    this.postTitle,
    this.documents,
    // this.links,
  }) : super(
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
  factory MeasureModel.fromJson(Map<String, dynamic> json) =>
      _$MeasureModelFromJson(json);

  /// Maps Model to Json
  Map<String, dynamic> toJson() => _$MeasureModelToJson(this);
}
