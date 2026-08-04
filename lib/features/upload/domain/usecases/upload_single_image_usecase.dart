import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/models/uploaded_file_model.dart';
import '../repository/upload_repository.dart';

class UploadSingleImageParams {
  final XFile file;
  final String folderPath;
  final UploadProgressCallback? onSendProgress;
  final CancelToken? cancelToken;

  const UploadSingleImageParams({
    required this.file,
    this.folderPath = 'users',
    this.onSendProgress,
    this.cancelToken,
  });
}

@lazySingleton
class UploadSingleImageUseCase
    extends BaseUseCase<UploadedFileModel, UploadSingleImageParams> {
  final UploadRepository _repository;

  UploadSingleImageUseCase(this._repository);

  @override
  Future<ApiResult<UploadedFileModel>> call(
    UploadSingleImageParams parameters,
  ) async {
    return _repository.uploadSingleImage(
      parameters.file,
      folderPath: parameters.folderPath,
      onSendProgress: parameters.onSendProgress,
      cancelToken: parameters.cancelToken,
    );
  }
}
