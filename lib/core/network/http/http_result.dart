import '../error/failure.dart';

sealed class HttpResult<T> {
  const HttpResult();

  factory HttpResult.success(T data) => HttpSuccess(data);
  factory HttpResult.failure(Failure failure) => HttpError(failure);

  bool get isSuccess => this is HttpSuccess;
  bool get isFailure => this is HttpError;
}

final class HttpSuccess<T> extends HttpResult<T> {
  final T data;
  const HttpSuccess(this.data);
}

final class HttpError<T> extends HttpResult<T> {
  final Failure failure;
  const HttpError(this.failure);
}
