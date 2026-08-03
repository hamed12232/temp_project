import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/enums/enums.dart';
import '../../data/models/auth_response.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(RequestStatus.initial) RequestStatus status,
    String? message,
    String? errorMessage,
    AuthResponse? authResponse,
  }) = _LoginState;
}
