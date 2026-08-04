import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../domain/entities/upload_item.dart';

part 'upload_state.freezed.dart';

@freezed
abstract class UploadState with _$UploadState {
  const factory UploadState({
    @Default([]) List<UploadItem> items,
    @Default(UploadStatus.initial) UploadStatus status,
    Failure? failure,
  }) = _UploadState;
}
