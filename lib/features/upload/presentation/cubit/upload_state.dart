import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../data/models/uploaded_file_model.dart';

part 'upload_state.freezed.dart';

@freezed
abstract class UploadState with _$UploadState {
  const factory UploadState({
    @Default([]) List<XFile> selectedImages,
    @Default([]) List<UploadedFileModel> uploadedFiles,
    @Default(false) bool isUploading,
    @Default(0.0) double uploadProgress,
    @Default(UploadStatus.initial) UploadStatus status,
    Failure? failure,
  }) = _UploadState;
}
