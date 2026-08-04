import 'package:json_annotation/json_annotation.dart';

import 'uploaded_file_model.dart';

part 'upload_file_response.g.dart';

@JsonSerializable()
class UploadFileResponse {
  final List<UploadedFileModel> files;

  const UploadFileResponse({required this.files});

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);
}
