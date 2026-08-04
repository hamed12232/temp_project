import 'package:json_annotation/json_annotation.dart';

part 'remote_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class RemoteResponse<T> {
  final T data;
  final bool success;
  final String message;
  @JsonKey(defaultValue: {})
  final Map<String, dynamic> errors;

  const RemoteResponse({
    required this.data,
    required this.success,
    required this.message,
    required this.errors,
  });

  factory RemoteResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$RemoteResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$RemoteResponseToJson(this, toJsonT);
}
