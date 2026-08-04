import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/network/models/api_result.dart';
import '../../data/models/uploaded_file_model.dart';

typedef UploadProgressCallback = void Function(int sent, int total);

abstract class UploadRepository {
  Future<ApiResult<UploadedFileModel>> uploadSingleImage(
    XFile image, {
    String folderPath = 'users',
    UploadProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  });
}
