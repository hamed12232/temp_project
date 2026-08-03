import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/enums/enums.dart';
import 'otp_state.dart';

@injectable
class OtpCubit extends Cubit<OtpState> {
  Timer? _timer;

  OtpCubit() : super(const OtpState());

  void startTimer({int seconds = 60}) {
    _timer?.cancel();
    emit(state.copyWith(remainingSeconds: seconds, canResend: false));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 1) {
        emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
      } else {
        _timer?.cancel();
        emit(state.copyWith(remainingSeconds: 0, canResend: true));
      }
    });
  }

  void resendOtp() {
    if (!state.canResend) return;

    startTimer();
  }

  void verifyOtp(String code) {
    emit(state.copyWith(otpState: OtpStates.loading));

    //then in the future the logic will be here
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
