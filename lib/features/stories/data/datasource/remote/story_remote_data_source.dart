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
    final response = await _apiService.getStories();
    return response.data;
  }
}
