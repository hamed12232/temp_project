import 'dart:developer' as developer;
import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log('➡️ [${options.method}] ${options.uri}', name: 'Network');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(
      '✅ [${response.statusCode}] ${response.requestOptions.uri}',
      name: 'Network',
    );
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log(
      '❌ [${err.response?.statusCode ?? 'ERROR'}] ${err.requestOptions.uri}',
      name: 'Network',
      error: err.message,
    );
    return handler.next(err);
  }
}
