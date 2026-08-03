import 'dart:async';

import 'package:http/http.dart' as http;

import '../error/failure.dart';

class HttpException implements Exception {
  final String message;
  final int? statusCode;
  final String? url;
  final dynamic originalException;

  const HttpException({
    required this.message,
    this.statusCode,
    this.url,
    this.originalException,
  });

  Failure toFailure() {
    if (statusCode == 401 || statusCode == 403) {
      return UnauthorizedFailure(
        message: message,
        statusCode: statusCode ?? 401,
      );
    }
    if (statusCode != null && statusCode! >= 500) {
      return ServerFailure(message: message, statusCode: statusCode);
    }
    if (originalException is TimeoutException ||
        originalException is http.ClientException) {
      return NetworkFailure(message: message, statusCode: statusCode);
    }
    return UnknownFailure(message: message, statusCode: statusCode);
  }
}
