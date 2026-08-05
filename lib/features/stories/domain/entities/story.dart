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

  const Story({
    required this.id,
    required this.type,
    required this.mediaUrl,
    required this.title,
    required this.description,
    required this.publishDate,
    required this.time,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        mediaUrl,
        title,
        description,
        publishDate,
        time,
      ];
}
