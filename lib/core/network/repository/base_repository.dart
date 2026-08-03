import '../error/error_handler.dart';
import '../models/api_result.dart';

abstract class BaseRepository {
  const BaseRepository();

  Future<ApiResult<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return ApiResult.success(response);
    } catch (error) {
      final failure = ErrorHandler.handle(error);
      return ApiResult.failure(failure);
    }
  }
}
