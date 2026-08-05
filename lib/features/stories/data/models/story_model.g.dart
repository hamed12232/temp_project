// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
  id: json['id'],
  type: json['type'] as String?,
  mediaUrl: json['media_url'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  publishDate: json['publish_date'] as String?,
  time: json['time'] as String?,
);

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'media_url': instance.mediaUrl,
      'title': instance.title,
      'description': instance.description,
      'publish_date': instance.publishDate,
      'time': instance.time,
    };
