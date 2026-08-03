import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:temp_project/core/utils/enums/enums.dart';

part 'otp_state.freezed.dart';

@freezed
abstract class OtpState with _$OtpState {
  const factory OtpState({
    @Default(60) int remainingSeconds,
    @Default(OtpStates.initial)OtpStates otpState,
    @Default(false) bool canResend,
  }) = _OtpState;
}