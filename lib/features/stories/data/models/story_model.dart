import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/story.dart';

part 'story_model.g.dart';

@JsonSerializable()
class StoryModel {
  final dynamic id;
  final String? type;
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  final String? title;
  final String? description;
  @JsonKey(name: 'publish_date')
  final String? publishDate;
  final String? time;

  const StoryModel({
    this.id,
    this.type,
    this.mediaUrl,
    this.title,
    this.description,
    this.publishDate,
    this.time,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryModelToJson(this);

  Story toEntity() {
    return Story(
      id: id?.toString() ?? '',
      type: (type?.toLowerCase() == 'video')
          ? StoryType.video
          : StoryType.image,
      mediaUrl: mediaUrl ?? '',
      title: title ?? '',
      description: description ?? '',
      publishDate: publishDate ?? '',
      time: time ?? '',
    );
  }
}
