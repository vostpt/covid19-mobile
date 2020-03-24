// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) {
  return VideoModel(
    id: json['ID'] as int,
    author: json['post_author'] as String,
    date: json['post_date'] as String,
    postDateGmt: json['post_date_gmt'] as String,
    postExcerpt: json['post_excerpt'] as String,
    postStatus: json['post_status'] as String,
    commentStatus: json['comment_status'] as String,
    pingStatus: json['ping_status'] as String,
    postPassword: json['post_password'] as String,
    postName: json['post_name'] as String,
    toPing: json['to_ping'] as String,
    pinged: json['pinged'] as String,
    postModified: json['post_modified'] as String,
    postModifiedGMT: json['post_modified_gmt'] as String,
    postContentFiltered: json['post_content_filtered'] as String,
    postParent: json['post_parent'] as int,
    guid: json['guid'] as String,
    menuOrder: json['menu_order'] as int,
    postType: json['post_type'] as String,
    postMimeType: json['post_mime_type'] as String,
    commentCount: json['comment_count'] as String,
    filter: json['filter'] as String,
    postTitle: json['post_title'] as String,
    video: json['video'] as String,
    description: json['descricao'] as String,
  );
}

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('post_author', instance.author);
  writeNotNull('post_date', instance.date);
  writeNotNull('post_date_gmt', instance.postDateGmt);
  writeNotNull('post_excerpt', instance.postExcerpt);
  writeNotNull('post_status', instance.postStatus);
  writeNotNull('comment_status', instance.commentStatus);
  writeNotNull('ping_status', instance.pingStatus);
  writeNotNull('post_password', instance.postPassword);
  writeNotNull('post_name', instance.postName);
  writeNotNull('to_ping', instance.toPing);
  writeNotNull('pinged', instance.pinged);
  writeNotNull('post_modified', instance.postModified);
  writeNotNull('post_modified_gmt', instance.postModifiedGMT);
  writeNotNull('post_content_filtered', instance.postContentFiltered);
  writeNotNull('post_parent', instance.postParent);
  writeNotNull('guid', instance.guid);
  writeNotNull('menu_order', instance.menuOrder);
  writeNotNull('post_type', instance.postType);
  writeNotNull('post_mime_type', instance.postMimeType);
  writeNotNull('comment_count', instance.commentCount);
  writeNotNull('filter', instance.filter);
  writeNotNull('post_title', instance.postTitle);
  writeNotNull('video', instance.video);
  writeNotNull('descricao', instance.description);
  return val;
}
