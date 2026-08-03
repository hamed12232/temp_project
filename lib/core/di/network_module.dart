import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:temp_project/core/network/dio/dio_factory.dart';
import 'package:temp_project/core/storage/token_storage.dart';
import 'package:temp_project/features/auth/data/datasource/remote/auth_api_service.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  http.Client get client => http.Client();
  @lazySingleton
  DioFactory dioFactory(TokenStorage storage) => DioFactory(storage);

  @lazySingleton
  Dio dio(DioFactory factory) => factory.getDio();
  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();
  @lazySingleton
  AuthApiService authApiService(Dio dio) => AuthApiService(dio);
}
