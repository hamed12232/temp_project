import 'package:dio/dio.dart';
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
  Future<ApiResult<UploadedFileModel>> uploadSingleImage(
    XFile image, {
    String folderPath = 'users',
    UploadProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    return safeApiCall(() async {
      final response = await _remoteDataSource.uploadSingleImage(
        image,
        folderPath: folderPath,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      return response.data.data.files.first;
    });
  }
}
