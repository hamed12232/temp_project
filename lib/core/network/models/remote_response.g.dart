// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteResponse<T> _$RemoteResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => RemoteResponse<T>(
  data: fromJsonT(json['data']),
  success: json['success'] as bool,
  message: json['message'] as String,
  errors: json['errors'] as Map<String, dynamic>? ?? {},
);

Map<String, dynamic> _$RemoteResponseToJson<T>(
  RemoteResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'success': instance.success,
  'message': instance.message,
  'errors': instance.errors,
};
