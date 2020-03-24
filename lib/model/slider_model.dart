///    This program is free software: you can redistribute it and/or modify
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

part 'slider_model.g.dart';

/// Slider Model
@JsonSerializable(includeIfNull: false)
class SliderModel extends BasePostModel {
  /// Order of this slider
  @JsonKey(name: 'order')
  final int order;

  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'post_title')
  final String title;

  @JsonKey(name: 'url')
  final String url;

  /// Model constructor
  ///
  /// All properties are mandatory
  ///
  SliderModel({
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
    this.order,
    this.image,
    this.title,
    this.url,
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
  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  /// Maps Model to Json
  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}
