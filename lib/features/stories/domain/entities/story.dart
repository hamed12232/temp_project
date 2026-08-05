import 'package:equatable/equatable.dart';

enum StoryType {
  image,
  video,
}

class Story extends Equatable {
  final String id;
  final StoryType type;
  final String mediaUrl;
  final String title;
  final String description;
  final String publishDate;
  final String time;
  final Duration? duration;

  const Story({
    required this.id,
    required this.type,
    required this.mediaUrl,
    required this.title,
    required this.description,
    required this.publishDate,
    required this.time,
    this.duration,
  });

  /// Returns the effective duration for an image story (custom backend duration or 5s default fallback).
  Duration get effectiveImageDuration =>
      duration ?? const Duration(seconds: 5);

  @override
  List<Object?> get props => [
        id,
        type,
        mediaUrl,
        title,
        description,
        publishDate,
        time,
        duration,
      ];
}
