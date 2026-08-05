import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/error/failure.dart';
import '../../domain/entities/story.dart';

part 'stories_state.freezed.dart';

@freezed
sealed class StoriesState with _$StoriesState {
  const factory StoriesState.initial() = _Initial;
  const factory StoriesState.loading() = _Loading;
  const factory StoriesState.success(List<Story> stories) = _Success;
  const factory StoriesState.error(Failure failure) = _Error;
}
