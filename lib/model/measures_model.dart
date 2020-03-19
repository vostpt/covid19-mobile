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

part 'measures_model.g.dart';

/// Measures Model
@JsonSerializable(includeIfNull: false)
class MeasuresModel {
  /// ID of the measure publication ppost
  @JsonKey(name: 'ID')
  final String id;

  /// Author of this mmeasure information
  @JsonKey(name: 'post_author')
  final String author;

  /// Publication time
  @JsonKey(name: 'post_date')
  final String date;

  /// Publication time in GMT
  @JsonKey(name: 'post_date_gmt')
  final String postDateGmt;

  /// Content information of this measure
  @JsonKey(name: 'post_content')
  final String postContent;

  /// Title information of this measure
  @JsonKey(name: 'post_title')
  final String postTitle;

  /// Shortened information about this measure
  @JsonKey(name: 'post_excerpt')
  final String postExcerpt;

  /// Status of the measure post
  @JsonKey(name: 'post_status')
  final String postStatus;

  /// Status of the comments for this measure post
  @JsonKey(name: 'comment_status')
  final String commentStatus;

  /// Status of the ping of this measure post
  @JsonKey(name: 'ping_status')
  final String pingStatus;

  /// Passowrd hash for this post if exists
  @JsonKey(name: 'post_password')
  final String postPassword;

  /// Name of the publication measure
  @JsonKey(name: 'post_name')
  final String postName;

  /// Ping post
  @JsonKey(name: 'to_ping')
  final String toPing;

  /// If this post was pinged
  @JsonKey(name: 'pinged')
  final String pinged;

  /// When whas the ping modified
  @JsonKey(name: 'post_modified')
  final String postModified;

  /// Date for when post was modified in GMT
  @JsonKey(name: 'post_modified_gmt')
  final String postModifiedGMT;

  /// The post filtered by string
  @JsonKey(name: 'post_content_filtered')
  final String postContentFiltered;

  /// What is the post parent, if exists
  @JsonKey(name: 'post_parent')
  final int postParent;

  /// Unique URL identifier of this post
  @JsonKey(name: 'guid')
  final String guid;

  /// Order in the menu if needed
  @JsonKey(name: 'menu_order')
  final int menuOrder;

  /// Post type
  @JsonKey(name: 'post_type')
  final String postType;

  /// PostMIME Type
  @JsonKey(name: 'post_mime_type')
  final String postMimeType;

  /// Number of comments the post has
  @JsonKey(name: 'comment_count')
  final String commentCount;

  /// What is the filter
  @JsonKey(name: 'filter')
  final String filter;

  /// If it has documents attached
  @JsonKey(name: 'documentos')
  final bool documents;

  /// If it has links attached
  @JsonKey(name: 'links')
  final bool links;

  /// Model constructor
  ///
  /// All properties are mandatory
  ///
  MeasuresModel({
    this.id,
    this.author,
    this.date,
    this.postDateGmt,
    this.postContent,
    this.postTitle,
    this.postExcerpt,
    this.postStatus,
    this.commentStatus,
    this.pingStatus,
    this.postPassword,
    this.postName,
    this.toPing,
    this.pinged,
    this.postModified,
    this.postModifiedGMT,
    this.postContentFiltered,
    this.postParent,
    this.guid,
    this.menuOrder,
    this.postType,
    this.postMimeType,
    this.commentCount,
    this.filter,
    this.documents,
    this.links,
  });

  static List<MeasuresModel> fromJson(List<Map<String, dynamic>> json) {
    return json.map(_$MeasuresModelFromJson).toList();
  }

  /// Maps Model to Json
  Map<String, dynamic> toJson() => _$MeasuresModelToJson(this);
}
