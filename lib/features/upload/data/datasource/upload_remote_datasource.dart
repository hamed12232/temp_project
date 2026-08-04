import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api/api_endpoints.dart';
import '../../../../core/network/models/remote_response.dart';
import '../models/upload_file_response.dart';

part 'upload_remote_datasource.g.dart';

@RestApi()
abstract class UploadApiService {
  factory UploadApiService(Dio dio) = _UploadApiService;

  @MultiPart()
  @POST(ApiEndpoints.uploadFile)
  Future<HttpResponse<RemoteResponse<UploadFileResponse>>> uploadImages(
    @Part(name: "path") String path,
    @Part(name: "image[]") List<MultipartFile> images, {
    @SendProgress() ProgressCallback? onSendProgress,
    @CancelRequest() CancelToken? cancelToken,
  });
}

@lazySingleton
class UploadRemoteDataSource {
  final UploadApiService _apiService;

  UploadRemoteDataSource(this._apiService);

  Future<HttpResponse<RemoteResponse<UploadFileResponse>>> uploadSingleImage(
    XFile file, {
    String folderPath = 'users',
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    final multipartFile = await MultipartFile.fromFile(
      file.path,
      filename: file.name,
    );

    return _apiService.uploadImages(
      folderPath,
      [multipartFile],
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );
  }
}
