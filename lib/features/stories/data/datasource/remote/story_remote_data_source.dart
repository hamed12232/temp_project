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
      title: 'Legalive Stories',
      description:
          'Soft pastel gradient hero illustration, dreamy minimal 3D style, floating feather pen with a subtle metallic shine, gentle motion blur, abstract flowing shapes and soft light particles, clean spacious composition, premium modern app aesthetic, smooth glossy materials, soft shadows',
      publishDate: '',
      time: '2h',
      duration: null, // Default 5s fallback
    ),
    StoryModel(
      id: '2',
      mediaType: 'image',
      mediaUrl: 'https://img.youtube.com/vi/dQw4w9WgXcQ/maxresdefault.jpg',
      title: 'Legalive Stories',
      description:
          'Minimalist architecture design with warm sunset ambient lighting, smooth glass reflections, cinematic depth of field, and elegant typography presentation.',
      publishDate: '',
      time: '3h',
      duration: 8, // Backend-controlled custom 8s duration
    ),
    StoryModel(
      id: '3',
      mediaType: 'image',
      mediaUrl: 'https://img.youtube.com/vi/dQw4w9WgXcQ/maxresdefault.jpg',
      title: 'Legalive Stories',
      description:
          'Creative legal branding and modern visual identity overview, featuring responsive mobile UI components, fluid animations, and dark mode interface.',
      publishDate: '',
      time: '5h',
      duration: null,
    ),
  ];
}
