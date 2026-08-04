import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:temp_project/core/utils/enums/enums.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/services/image_picker/image_picker_result.dart';
import '../../../../core/services/image_picker/image_picker_service.dart';
import '../../domain/usecases/upload_images_usecase.dart';
import 'upload_state.dart';

@injectable
class UploadCubit extends Cubit<UploadState> {
  final ImagePickerService _imagePickerService;
  final UploadImagesUseCase _uploadImagesUseCase;

  UploadCubit(this._imagePickerService, this._uploadImagesUseCase)
      : super(const UploadState());

  Future<void> pickImages() async {
    emit(state.copyWith(status: UploadStatus.pickingImages));

    final images = await _imagePickerService.pickMultipleImages();

    if (images.isNotEmpty) {
      final updatedImages = [...state.selectedImages, ...images];
      emit(
        state.copyWith(
          selectedImages: updatedImages,
          status: UploadStatus.imagesSelected,
          failure: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: state.selectedImages.isEmpty
              ? UploadStatus.initial
              : UploadStatus.imagesSelected,
        ),
      );
    }
  }

  Future<void> pickSingleImage(ImagePickerSource source) async {
    emit(state.copyWith(status: UploadStatus.pickingImages));

    final image = await _imagePickerService.pickSingleImage(source);

    if (image != null) {
      final updatedImages = [...state.selectedImages, image];
      emit(
        state.copyWith(
          selectedImages: updatedImages,
          status: UploadStatus.imagesSelected,
          failure: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: state.selectedImages.isEmpty
              ? UploadStatus.initial
              : UploadStatus.imagesSelected,
        ),
      );
    }
  }

  void removeImage(int index) {
    if (index < 0 || index >= state.selectedImages.length) return;

    final updatedImages = [...state.selectedImages]..removeAt(index);
    emit(
      state.copyWith(
        selectedImages: updatedImages,
        status: updatedImages.isEmpty
            ? UploadStatus.initial
            : UploadStatus.imagesSelected,
        failure: null,
      ),
    );
  }

  void clearImages() {
    emit(const UploadState());
  }

  Future<void> uploadImages() async {
    if (state.selectedImages.isEmpty) return;

    emit(
      state.copyWith(
        status: UploadStatus.uploading,
        isUploading: true,
        failure: null,
      ),
    );

    final result = await _uploadImagesUseCase(state.selectedImages);

    result.when(
      success: (uploadedFiles) {
        emit(
          state.copyWith(
            status: UploadStatus.uploadSuccess,
            isUploading: false,
            uploadedFiles: uploadedFiles,
            selectedImages: [],
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            status: UploadStatus.uploadFailure,
            isUploading: false,
            failure: failure,
          ),
        );
      },
    );
  }

  void retry() {
    uploadImages();
  }
}
