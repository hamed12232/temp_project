import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../data/models/uploaded_file_model.dart';

class UploadItem {
  final String id;
  final XFile image;
  final double progress;
  final UploadItemStatus status;
  final UploadedFileModel? uploadedFile;
  final Failure? failure;
  final CancelToken? cancelToken;

  const UploadItem({
    required this.id,
    required this.image,
    this.progress = 0.0,
    this.status = UploadItemStatus.initial,
    this.uploadedFile,
    this.failure,
    this.cancelToken,
  });

  UploadItem copyWith({
    String? id,
    XFile? image,
    double? progress,
    UploadItemStatus? status,
    UploadedFileModel? uploadedFile,
    Failure? failure,
    CancelToken? cancelToken,
  }) {
    return UploadItem(
      id: id ?? this.id,
      image: image ?? this.image,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      uploadedFile: uploadedFile ?? this.uploadedFile,
      failure: failure ?? this.failure,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }
}
