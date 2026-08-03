import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginState());

  Future<void> login({
    required String phone,
    required String countryCode,
  }) async {
    emit(state.copyWith(status: RequestStatus.loading, errorMessage: null));

    final result = await _loginUseCase(
      LoginParams(phone: phone, countryCode: countryCode),
    );

    result.when(
      success: (authResponse) {
        emit(
          state.copyWith(
            status: RequestStatus.success,
            authResponse: authResponse,
            message: 'Login successful',
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }
}
