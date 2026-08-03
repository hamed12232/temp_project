import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums/enums.dart';
import '../../data/models/auth_response.dart';

class LoginState extends Equatable {
  final RequestStatus status;
  final String? message;
  final String? errorMessage;
  final AuthResponse? authResponse;

  const LoginState({
    this.status = RequestStatus.initial,
    this.message,
    this.errorMessage,
    this.authResponse,
  });

  LoginState copyWith({
    RequestStatus? status,
    String? message,
    String? errorMessage,
    AuthResponse? authResponse,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      authResponse: authResponse ?? this.authResponse,
    );
  }

  @override
  List<Object?> get props => [status, message, errorMessage, authResponse];
}
