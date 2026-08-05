import '../../../../core/network/models/api_result.dart';
import '../entities/story.dart';

abstract class StoryRepository {
  Future<ApiResult<List<Story>>> getStories();
}
