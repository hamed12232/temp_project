import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/network/repository/base_repository.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/remote/auth_api_service.dart';
import '../models/auth_response.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<ApiResult<AuthResponse>> login({
    required String phone,
    required String countryCode,
  }) async {
    return safeApiCall(() async {
      final response = await _apiService.login({
        'phone': phone,
        'country_code': countryCode,
      });
      return response.data;
    });
  }
  @override
  Future<ApiResult<AuthResponse>> refreshToken({
    required String refreshToken,
  }) async {
    return safeApiCall(() async {
      final response = await _apiService.refreshToken({
        'refreshToken': refreshToken,
      });
      return response.data;
    });
  }
}
