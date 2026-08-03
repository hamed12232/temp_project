import 'package:dio/dio.dart';

import 'api_error_model.dart';
import 'failure.dart';

class ErrorHandler {
  const ErrorHandler._();

  static Failure handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is Failure) {
      return error;
    }
    return UnknownFailure(message: error?.toString() ?? 'Unexpected error');
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkFailure(
          message: 'Connection timed out (${error.message ?? error.error}).',
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);

      case DioExceptionType.cancel:
        return const NetworkFailure(message: 'Request was cancelled.');

      default:
        final msg =
            error.message ??
            error.error?.toString() ??
            'Network error occurred';
        return NetworkFailure(message: msg);
    }
  }

  static Failure _handleBadResponse(Response? response) {
    if (response == null) return const UnknownFailure();

    final statusCode = response.statusCode;
    String? message;

    if (response.data is Map<String, dynamic>) {
      try {
        final errorModel = ApiErrorModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        message = errorModel.message;
      } catch (_) {}

      message ??= response.data['message']?.toString();
      message ??= response.data['error']?.toString();
      message ??= response.data['msg']?.toString();
    } else if (response.data is String) {
      message = response.data as String;
    }

    if (statusCode == 401) {
      return UnauthorizedFailure(
        message: message ?? 'Session expired. Please log in again.',
      );
    }

    return ServerFailure(
      statusCode: statusCode,
      message: message ?? 'Server returned status code $statusCode',
    );
  }
}
