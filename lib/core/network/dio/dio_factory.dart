import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/api_constants.dart';
import '../interceptors/auth_interceptor.dart';
import '../interceptors/logger_interceptor.dart';
import '../../storage/token_storage.dart';

class DioFactory {
  final TokenStorage _tokenStorage;

  DioFactory(this._tokenStorage);

  Dio getDio() {
    final dio = Dio(
      
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: kIsWeb ? null : ApiConstants.sendTimeout,
        

        headers: {
          ApiConstants.contentType: ApiConstants.applicationJson,
          ApiConstants.accept: ApiConstants.applicationJson,
          ApiConstants.authorization:
              '${ApiConstants.bearer} ${ApiConstants.apiKey}',
          ApiConstants.apiKeyHeader: ApiConstants.apiKey,
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(_tokenStorage),
      LoggerInterceptor(),
    ]);

    return dio;
  }
}
