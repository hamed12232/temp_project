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
    @Part(name: "image[]") List<MultipartFile> images,
  );
}

/// Only place in the app where XFile → MultipartFile conversion happens.
@lazySingleton
class UploadRemoteDataSource {
  final UploadApiService _apiService;

  UploadRemoteDataSource(this._apiService);

  Future<HttpResponse<RemoteResponse<UploadFileResponse>>> uploadImages(
    List<XFile> files, {
    String folderPath = 'users',
  }) async {
    final multipartFiles = await Future.wait(
      files.map(
        (file) => MultipartFile.fromFile(
          file.path,
          filename: file.name,
        ),
      ),
    );

    return _apiService.uploadImages(folderPath, multipartFiles);
  }
}
