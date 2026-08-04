import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/models/uploaded_file_model.dart';
import '../repository/upload_repository.dart';

@lazySingleton
class UploadImagesUseCase
    extends BaseUseCase<List<UploadedFileModel>, List<XFile>> {
  final UploadRepository _repository;

  UploadImagesUseCase(this._repository);

  @override
  Future<ApiResult<List<UploadedFileModel>>> call(
    List<XFile> parameters,
  ) async {
    return _repository.uploadImages(parameters);
  }
}
