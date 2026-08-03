import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:temp_project/core/network/api/api_endpoints.dart';

import '../../models/auth_response.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  @POST(ApiEndpoints.login)
  Future<HttpResponse<AuthResponse>> login(@Body() Map<String, dynamic> body);

  @POST(ApiEndpoints.refreshToken)
  Future<HttpResponse<AuthResponse>> refreshToken(
    @Body() Map<String, dynamic> body,
  );
}
