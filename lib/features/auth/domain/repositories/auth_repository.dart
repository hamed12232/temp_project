import '../../../../core/network/models/api_result.dart';
import '../../data/models/auth_response.dart';

abstract class AuthRepository {
  Future<ApiResult<AuthResponse>> login({
    required String phone,
    required String countryCode,
  });

  Future<ApiResult<AuthResponse>> refreshToken({
    required String refreshToken,
  });
}
