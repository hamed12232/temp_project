import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/network/repository/base_repository.dart';
import '../../domain/entities/story.dart';
import '../../domain/repositories/story_repository.dart';
import '../datasource/remote/story_remote_data_source.dart';

@LazySingleton(as: StoryRepository)
class StoryRepositoryImpl extends BaseRepository implements StoryRepository {
  final StoryRemoteDataSource _remoteDataSource;

  StoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<Story>>> getStories() async {
    return safeApiCall(() async {
      final models = await _remoteDataSource.getStories();
      return models.map((model) => model.toEntity()).toList();
    });
  }
}
