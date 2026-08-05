import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/story.dart';

part 'story_model.g.dart';

@JsonSerializable()
class StoryModel {
  final dynamic id;
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  final String? title;
  final String? description;
  @JsonKey(name: 'publish_date')
  final String? publishDate;
  final String? time;
  final int? duration;

  const StoryModel({
    this.id,
    this.mediaType,
    this.mediaUrl,
    this.title,
    this.description,
    this.publishDate,
    this.time,
    this.duration,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryModelToJson(this);

  Story toEntity() {
    return Story(
      id: id?.toString() ?? '',
      type: (mediaType?.toLowerCase() == 'video')
          ? StoryType.video
          : StoryType.image,
      mediaUrl: mediaUrl ?? '',
      title: title ?? '',
      description: description ?? '',
      publishDate: publishDate ?? '',
      time: time ?? '',
      duration: duration != null ? Duration(seconds: duration!) : null,
    );
  }
}
