import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/services/image_picker/image_picker_result.dart';
import '../../../../core/services/image_picker/image_picker_service.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../domain/entities/upload_item.dart';
import '../../domain/usecases/upload_single_image_usecase.dart';
import 'upload_state.dart';

@injectable
class UploadCubit extends Cubit<UploadState> {
  final ImagePickerService _imagePickerService;
  final UploadSingleImageUseCase _uploadSingleImageUseCase;

  UploadCubit(this._imagePickerService, this._uploadSingleImageUseCase)
    : super(const UploadState());

  /// Pick multiple images from gallery and immediately start uploading them concurrently.
  Future<void> pickImages() async {
    final images = await _imagePickerService.pickMultipleImages();
    if (images.isEmpty) return;

    final newItems = images.map((image) {
      final id =
          '${DateTime.now().microsecondsSinceEpoch}_${image.path.hashCode}';
      return UploadItem(id: id, image: image, status: UploadItemStatus.initial);
    }).toList();

    final updatedItems = [...state.items, ...newItems];
    emit(
      state.copyWith(items: updatedItems, status: UploadStatus.imagesSelected),
    );

    // Concurrently upload all newly added items
    await _uploadMultipleItems(newItems.map((item) => item.id).toList());
  }

  /// Pick single image from source and immediately start uploading.
  Future<void> pickSingleImage(ImagePickerSource source) async {
    final image = await _imagePickerService.pickSingleImage(source);
    if (image == null) return;

    final id =
        '${DateTime.now().microsecondsSinceEpoch}_${image.path.hashCode}';
    final newItem = UploadItem(
      id: id,
      image: image,
      status: UploadItemStatus.initial,
    );

    final updatedItems = [...state.items, newItem];
    emit(
      state.copyWith(items: updatedItems, status: UploadStatus.imagesSelected),
    );

    await _uploadItem(id);
  }

  /// Upload multiple items concurrently using Future.wait.
  Future<void> _uploadMultipleItems(List<String> ids) async {
    await Future.wait(ids.map((id) => _uploadItem(id)));
  }

  /// Upload a single item by its ID.
  Future<void> _uploadItem(String id) async {
    final index = state.items.indexWhere((item) => item.id == id);
    if (index == -1) return;

    final currentItem = state.items[index];
    final cancelToken = CancelToken();

    _updateItemState(
      id,
      (item) => item.copyWith(
        status: UploadItemStatus.uploading,
        progress: 0.0,
        cancelToken: cancelToken,
        failure: null,
      ),
    );

    final params = UploadSingleImageParams(
      file: currentItem.image,
      cancelToken: cancelToken,
      onSendProgress: (sent, total) {
        if (total > 0) {
          final progress = (sent / total).clamp(0.0, 1.0);
          _updateItemState(id, (item) => item.copyWith(progress: progress));
        } else {
          _updateItemState(id, (item) => item.copyWith(progress: -1.0));
        }
      },
    );

    final result = await _uploadSingleImageUseCase(params);

    result.when(
      success: (uploadedFile) {
        _updateItemState(
          id,
          (item) => item.copyWith(
            status: UploadItemStatus.success,
            progress: 1.0,
            uploadedFile: uploadedFile,
          ),
        );
      },
      failure: (failure) {
        _updateItemState(
          id,
          (item) =>
              item.copyWith(status: UploadItemStatus.failure, failure: failure),
        );
      },
    );
  }

  /// Retry uploading a single item without restarting other items.
  Future<void> retryItem(String id) async {
    await _uploadItem(id);
  }

  /// Remove an item from the list.
  void removeItem(String id) {
    final index = state.items.indexWhere((item) => item.id == id);
    if (index == -1) return;

    final item = state.items[index];
    if (item.status == UploadItemStatus.uploading) {
      item.cancelToken?.cancel('User removed item');
    }

    final updatedItems = state.items.where((item) => item.id != id).toList();
    emit(state.copyWith(items: updatedItems));
  }

  /// Clear all items.
  void clearAll() {
    for (final item in state.items) {
      if (item.status == UploadItemStatus.uploading) {
        item.cancelToken?.cancel('User cleared all');
      }
    }
    emit(const UploadState());
  }

  /// Helper to update a specific item in state immutably.
  void _updateItemState(
    String id,
    UploadItem Function(UploadItem item) update,
  ) {
    final updatedItems = state.items.map((item) {
      if (item.id == id) {
        return update(item);
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedItems));
  }
}
