sealed class Failure {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  String toString() => '$runtimeType(message: $message, statusCode: $statusCode)';
}

final class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});
}

final class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Network connection failed. Please check your internet.',
    super.statusCode,
  });
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    super.message = 'Session expired. Please log in again.',
    super.statusCode = 401,
  });
}

final class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'An unexpected error occurred. Please try again.',
    super.statusCode,
  });
}
