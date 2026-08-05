import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/api/api_endpoints.dart';
import '../../models/story_model.dart';

part 'story_api_service.g.dart';

@RestApi()
abstract class StoryApiService {
  factory StoryApiService(Dio dio) = _StoryApiService;

  @GET(ApiEndpoints.stories)
  Future<HttpResponse<List<StoryModel>>> getStories();
}
