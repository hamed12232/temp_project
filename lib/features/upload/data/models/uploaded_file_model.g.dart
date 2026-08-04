// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedFileModel _$UploadedFileModelFromJson(Map<String, dynamic> json) =>
    UploadedFileModel(
      fileName: json['file_name'] as String,
      path: json['path'] as String,
      size: json['size'] as String,
    );

Map<String, dynamic> _$UploadedFileModelToJson(UploadedFileModel instance) =>
    <String, dynamic>{
      'file_name': instance.fileName,
      'path': instance.path,
      'size': instance.size,
    };
