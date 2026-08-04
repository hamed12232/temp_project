import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/network/repository/base_repository.dart';
import '../../domain/repository/upload_repository.dart';
import '../datasource/upload_remote_datasource.dart';
import '../models/uploaded_file_model.dart';

@LazySingleton(as: UploadRepository)
class UploadRepositoryImpl extends BaseRepository implements UploadRepository {
  final UploadRemoteDataSource _remoteDataSource;

  UploadRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<UploadedFileModel>>> uploadImages(
    List<XFile> images, {
    String folderPath = 'users',
    UploadProgressCallback? onSendProgress,
  }) async {
    return safeApiCall(() async {
      final response = await _remoteDataSource.uploadImages(
        images,
        folderPath: folderPath,
        onSendProgress: onSendProgress,
      );
      return response.data.data.files;
    });
  }
}
