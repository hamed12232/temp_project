import '../error/failure.dart';

sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) => Success<T>(data);
  factory ApiResult.failure(Failure failure) => FailureResult<T>(failure);
}

final class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

final class FailureResult<T> extends ApiResult<T> {
  final Failure failure;
  const FailureResult(this.failure);
}
