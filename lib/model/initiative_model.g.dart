// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiative_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiativeModel _$InitiativeModelFromJson(Map<String, dynamic> json) {
  return InitiativeModel(
    json['ID'] as int,
    json['title'] == null
        ? null
        : RenderedContentModel.fromJson(json['title'] as Map<String, dynamic>),
    json['content'] == null
        ? null
        : RenderedContentModel.fromJson(
            json['content'] as Map<String, dynamic>),
    json['post_author'] as String,
    json['post_date'] as String,
    json['post_date_gmt'] as String,
    json['post_excerpt'] as String,
    json['post_status'] as String,
    json['comment_status'] as String,
    json['ping_status'] as String,
    json['post_password'] as String,
    json['post_name'] as String,
    json['to_ping'] as String,
    json['pinged'] as String,
    json['post_modified'] as String,
    json['post_modified_gmt'] as String,
    json['post_content_filtered'] as String,
    json['post_parent'] as int,
    json['guid'] as String,
    json['menu_order'] as int,
    json['post_type'] as String,
    json['post_mime_type'] as String,
    json['comment_count'] as String,
    json['filter'] as String,
  );
}

Map<String, dynamic> _$InitiativeModelToJson(InitiativeModel instance) {
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
  writeNotNull('title', instance.title);
  writeNotNull('content', instance.content);
  return val;
}

RenderedContentModel _$RenderedContentModelFromJson(Map<String, dynamic> json) {
  return RenderedContentModel(
    rendered: json['rendered'] as String,
  );
}

Map<String, dynamic> _$RenderedContentModelToJson(
    RenderedContentModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rendered', instance.rendered);
  return val;
}
