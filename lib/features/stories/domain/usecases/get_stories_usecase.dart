import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entities/story.dart';
import '../repositories/story_repository.dart';

@lazySingleton
class GetStoriesUseCase implements BaseUseCase<List<Story>, NoParameters> {
  final StoryRepository _repository;

  const GetStoriesUseCase(this._repository);

  @override
  Future<ApiResult<List<Story>>> call(NoParameters parameters) {
    return _repository.getStories();
  }
}
