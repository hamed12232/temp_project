import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/models/api_result.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../domain/usecases/get_stories_usecase.dart';
import 'stories_state.dart';

@injectable
class StoriesCubit extends Cubit<StoriesState> {
  final GetStoriesUseCase _getStoriesUseCase;

  StoriesCubit(this._getStoriesUseCase) : super(const StoriesState.initial());

  Future<void> fetchStories() async {
    emit(const StoriesState.loading());

    final result = await _getStoriesUseCase(const NoParameters());

    result.when(
      success: (stories) => emit(StoriesState.success(stories)),
      failure: (failure) => emit(StoriesState.error(failure)),
    );
  }
}
