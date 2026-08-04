import 'package:json_annotation/json_annotation.dart';

part 'uploaded_file_model.g.dart';

@JsonSerializable()
class UploadedFileModel {
  @JsonKey(name: 'file_name')
  final String fileName;
  final String path;
  final String size;

  const UploadedFileModel({
    required this.fileName,
    required this.path,
    required this.size,
  });

  String get url => path;

  factory UploadedFileModel.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadedFileModelToJson(this);
}
