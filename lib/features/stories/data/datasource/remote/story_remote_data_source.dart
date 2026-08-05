import 'package:injectable/injectable.dart';

import '../../models/story_model.dart';
import 'story_api_service.dart';

abstract class StoryRemoteDataSource {
  Future<List<StoryModel>> getStories();
}

@LazySingleton(as: StoryRemoteDataSource)
class StoryRemoteDataSourceImpl implements StoryRemoteDataSource {
  final StoryApiService _apiService;

  StoryRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<StoryModel>> getStories() async {
    // try {
    //   final response = await _apiService.getStories();
    //   if (response.data.isNotEmpty) {
    //     return response.data;
    //   }
    // } catch (_) {
    //   // Fallback to local test dummy data when API endpoint is offline
    // }
    return _dummyStories;
  }

  static const List<StoryModel> _dummyStories = [
    StoryModel(
      id: '1',
      mediaType: 'image',
      mediaUrl: 'https://img.youtube.com/vi/dQw4w9WgXcQ/maxresdefault.jpg',
      title: 'Legalive Image Story',
      description:
          'Soft pastel gradient hero illustration, dreamy minimal 3D style, floating feather pen with a subtle metallic shine, gentle motion blur, abstract flowing shapes.',
      publishDate: '',
      time: '2h',
      duration: null, // Null -> defaults to 5s fallback
    ),
    StoryModel(
      id: '2',
      mediaType: 'image',
      mediaUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW5ZLUJlmeKLOEusGySCttEqM6OEOKTHEqCaeSVyg1cw&s=10',
      title: 'Legalive Image Story',
      description:
          'Soft pastel gradient hero illustration, dreamy minimal 3D style, floating feather pen with a subtle metallic shine, gentle motion blur, abstract flowing shapes.',
      publishDate: '',
      time: '2h',
      duration: null, // Null -> defaults to 5s fallback
    ),
    StoryModel(
      id: '3',
      mediaType: 'video',
      mediaUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      title: 'Legalive Video Story',
      description:
          'Cached video playback downloaded locally via VideoCacheService with exact video length matching.',
      publishDate: '',
      time: '5h',
      duration:
          null, // Auto-detects duration from local VideoPlayerController.file
    ),
  ];
}
