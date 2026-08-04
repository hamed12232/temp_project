import 'package:image_picker/image_picker.dart';

import '../../../../core/network/models/api_result.dart';
import '../../data/models/uploaded_file_model.dart';

abstract class UploadRepository {
  Future<ApiResult<List<UploadedFileModel>>> uploadImages(
    List<XFile> images, {
    String folderPath = 'users',
  });
}
