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

part 'remote_work_model.g.dart';


/// RemoteWork Model
///
/// This model uses Hive to be ready to save it to cache
///
/// RemoteWorkModel assigned typeId 2
///
@JsonSerializable(includeIfNull: false)
class RemoteWorkModel extends BasePostModel{

  /// Remote work types
  /// ex:
  ///   School -> escolas
  ///   Citizen -> cidadaos
  ///   Support -> suporte
  ///   Organizations -> organizacoes
  @JsonKey(name: 'tipo')
  final String remoteWorkType;

  @JsonKey(name: 'post_title')
  final String postTitle;

  /// This will have the content
  @JsonKey(name: 'descricao')
  final String description;

  /// If this in a training in Portuguese
  @JsonKey(name: 'formacao_em_portugues')
  final String trainingInPortuguese;

  /// How to access
  ///
  /// Informs how and the method to access this RemoteWork
  @JsonKey(name: 'como_aceder')
  final String howToAccess;

  /// Support Uri
  @JsonKey(name: 'suporte_tecnico')
  final String technicalSupportUri;

  /// Constructor
  ///
  /// All Fields are mandatory
  ///
  RemoteWorkModel(
      int id,
      this.postTitle,
      this.remoteWorkType,
      this.description,
      this.trainingInPortuguese,
      this.howToAccess,
      this.technicalSupportUri,
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
  factory RemoteWorkModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteWorkModelFromJson(json);

  /// Maps Model to Json
  Map<String, dynamic> toJson() => _$RemoteWorkModelToJson(this);

}