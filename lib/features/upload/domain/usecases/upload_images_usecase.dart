import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/models/uploaded_file_model.dart';
import '../repository/upload_repository.dart';

class UploadImagesParams {
  final List<XFile> files;
  final String folderPath;
  final UploadProgressCallback? onSendProgress;

  const UploadImagesParams({
    required this.files,
    this.folderPath = 'users',
    this.onSendProgress,
  });
}

@lazySingleton
class UploadImagesUseCase
    extends BaseUseCase<List<UploadedFileModel>, UploadImagesParams> {
  final UploadRepository _repository;

  UploadImagesUseCase(this._repository);

  @override
  Future<ApiResult<List<UploadedFileModel>>> call(
    UploadImagesParams parameters,
  ) async {
    return _repository.uploadImages(
      parameters.files,
      folderPath: parameters.folderPath,
      onSendProgress: parameters.onSendProgress,
    );
  }
}
