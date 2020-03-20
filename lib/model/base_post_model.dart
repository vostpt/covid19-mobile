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

/// Base Post Model
///
/// To use this model as a base, this must be extended AND the constructor needs
/// to be updated with the correct models:
///
/// ```dart
/// @JsonSerializable(includeIfNull: false)
/// class ExampleModel extends BasePostModel {
///
///    ExampleModel(
///        int id,
///        String author,
///        String date,
///        String postDateGmt,
///        String postExcerpt,
///        String postStatus,
///        String commentStatus,
///        String pingStatus,
///        String postPassword,
///        String postName,
///        String toPing,
///        String pinged,
///        String postModified,
///        String postModifiedGMT,
///        String postContentFiltered,
///        int postParent,
///        String guid,
///        int menuOrder,
///        String postType,
///        String postMimeType,
///        String commentCount,
///        String filter,
///        this.recovered,        // Class property
///        this.confirmed,        // Class property
///        this.suspected,        // Class property
///        this.awaitingResults,  // Class property
///        this.deaths)           // Class property
///        : super(
///            id: id,
///            author: author,
///            date: date,
///            postDateGmt: postDateGmt,
///            postExcerpt: postExcerpt,
///            postStatus: postStatus,
///            commentStatus: commentStatus,
///            pingStatus: pingStatus,
///            postPassword: postPassword,
///            postName: postName,
///            toPing: toPing,
///            pinged: pinged,
///            postModified: postModified,
///            postModifiedGMT: postModifiedGMT,
///            postContentFiltered: postContentFiltered,
///            postParent: postParent,
///            guid: guid,
///            menuOrder: menuOrder,
///            postType: postType,
///            postMimeType: postMimeType,
///            commentCount: commentCount,
///            filter: filter,
///          );
/// ```
///
/// This can be copied and used in new models
abstract class BasePostModel {
  /// ID of the measure publication ppost
  @JsonKey(name: 'ID')
  final int id;

  /// Author of this mmeasure information
  @JsonKey(name: 'post_author')
  final String author;

  /// Publication time
  @JsonKey(name: 'post_date')
  final String date;

  /// Publication time in GMT
  @JsonKey(name: 'post_date_gmt')
  final String postDateGmt;

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

  /// Model constructor
  ///
  /// All properties are mandatory
  ///
  BasePostModel({
    this.id,
    this.author,
    this.date,
    this.postDateGmt,
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
  });
}
