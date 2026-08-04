// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadState {

 List<XFile> get selectedImages; List<UploadedFileModel> get uploadedFiles; bool get isUploading; UploadStatus get status; Failure? get failure;
/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadStateCopyWith<UploadState> get copyWith => _$UploadStateCopyWithImpl<UploadState>(this as UploadState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadState&&const DeepCollectionEquality().equals(other.selectedImages, selectedImages)&&const DeepCollectionEquality().equals(other.uploadedFiles, uploadedFiles)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedImages),const DeepCollectionEquality().hash(uploadedFiles),isUploading,status,failure);

@override
String toString() {
  return 'UploadState(selectedImages: $selectedImages, uploadedFiles: $uploadedFiles, isUploading: $isUploading, status: $status, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $UploadStateCopyWith<$Res>  {
  factory $UploadStateCopyWith(UploadState value, $Res Function(UploadState) _then) = _$UploadStateCopyWithImpl;
@useResult
$Res call({
 List<XFile> selectedImages, List<UploadedFileModel> uploadedFiles, bool isUploading, UploadStatus status, Failure? failure
});




}
/// @nodoc
class _$UploadStateCopyWithImpl<$Res>
    implements $UploadStateCopyWith<$Res> {
  _$UploadStateCopyWithImpl(this._self, this._then);

  final UploadState _self;
  final $Res Function(UploadState) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedImages = null,Object? uploadedFiles = null,Object? isUploading = null,Object? status = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
selectedImages: null == selectedImages ? _self.selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<XFile>,uploadedFiles: null == uploadedFiles ? _self.uploadedFiles : uploadedFiles // ignore: cast_nullable_to_non_nullable
as List<UploadedFileModel>,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UploadStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadState].
extension UploadStatePatterns on UploadState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadState value)  $default,){
final _that = this;
switch (_that) {
case _UploadState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadState value)?  $default,){
final _that = this;
switch (_that) {
case _UploadState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<XFile> selectedImages,  List<UploadedFileModel> uploadedFiles,  bool isUploading,  UploadStatus status,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadState() when $default != null:
return $default(_that.selectedImages,_that.uploadedFiles,_that.isUploading,_that.status,_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<XFile> selectedImages,  List<UploadedFileModel> uploadedFiles,  bool isUploading,  UploadStatus status,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _UploadState():
return $default(_that.selectedImages,_that.uploadedFiles,_that.isUploading,_that.status,_that.failure);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<XFile> selectedImages,  List<UploadedFileModel> uploadedFiles,  bool isUploading,  UploadStatus status,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _UploadState() when $default != null:
return $default(_that.selectedImages,_that.uploadedFiles,_that.isUploading,_that.status,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _UploadState implements UploadState {
  const _UploadState({final  List<XFile> selectedImages = const [], final  List<UploadedFileModel> uploadedFiles = const [], this.isUploading = false, this.status = UploadStatus.initial, this.failure}): _selectedImages = selectedImages,_uploadedFiles = uploadedFiles;
  

 final  List<XFile> _selectedImages;
@override@JsonKey() List<XFile> get selectedImages {
  if (_selectedImages is EqualUnmodifiableListView) return _selectedImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedImages);
}

 final  List<UploadedFileModel> _uploadedFiles;
@override@JsonKey() List<UploadedFileModel> get uploadedFiles {
  if (_uploadedFiles is EqualUnmodifiableListView) return _uploadedFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uploadedFiles);
}

@override@JsonKey() final  bool isUploading;
@override@JsonKey() final  UploadStatus status;
@override final  Failure? failure;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadStateCopyWith<_UploadState> get copyWith => __$UploadStateCopyWithImpl<_UploadState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadState&&const DeepCollectionEquality().equals(other._selectedImages, _selectedImages)&&const DeepCollectionEquality().equals(other._uploadedFiles, _uploadedFiles)&&(identical(other.isUploading, isUploading) || other.isUploading == isUploading)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedImages),const DeepCollectionEquality().hash(_uploadedFiles),isUploading,status,failure);

@override
String toString() {
  return 'UploadState(selectedImages: $selectedImages, uploadedFiles: $uploadedFiles, isUploading: $isUploading, status: $status, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$UploadStateCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory _$UploadStateCopyWith(_UploadState value, $Res Function(_UploadState) _then) = __$UploadStateCopyWithImpl;
@override @useResult
$Res call({
 List<XFile> selectedImages, List<UploadedFileModel> uploadedFiles, bool isUploading, UploadStatus status, Failure? failure
});




}
/// @nodoc
class __$UploadStateCopyWithImpl<$Res>
    implements _$UploadStateCopyWith<$Res> {
  __$UploadStateCopyWithImpl(this._self, this._then);

  final _UploadState _self;
  final $Res Function(_UploadState) _then;

/// Create a copy of UploadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedImages = null,Object? uploadedFiles = null,Object? isUploading = null,Object? status = null,Object? failure = freezed,}) {
  return _then(_UploadState(
selectedImages: null == selectedImages ? _self._selectedImages : selectedImages // ignore: cast_nullable_to_non_nullable
as List<XFile>,uploadedFiles: null == uploadedFiles ? _self._uploadedFiles : uploadedFiles // ignore: cast_nullable_to_non_nullable
as List<UploadedFileModel>,isUploading: null == isUploading ? _self.isUploading : isUploading // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UploadStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
