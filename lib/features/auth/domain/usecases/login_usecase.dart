import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/models/auth_response.dart';
import '../repositories/auth_repository.dart';

class LoginParams extends Equatable {
  final String phone;
  final String countryCode;

  const LoginParams({
    required this.phone,
    required this.countryCode,
  });

  @override
  List<Object?> get props => [phone, countryCode];
}

@lazySingleton
class LoginUseCase extends BaseUseCase<AuthResponse, LoginParams> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<ApiResult<AuthResponse>> call(LoginParams parameters) async {
    return await _authRepository.login(
      phone: parameters.phone,
      countryCode: parameters.countryCode,
    );
  }
}
