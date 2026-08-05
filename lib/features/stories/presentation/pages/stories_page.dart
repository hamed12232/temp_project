import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_project/features/stories/presentation/widgets/stories_failure.dart';

import '../../../../core/di/injection.dart';
import '../cubit/stories_cubit.dart';
import '../cubit/stories_state.dart';
import '../widgets/story_viewer.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<StoriesCubit>()..fetchStories(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<StoriesCubit, StoriesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              error: (failure) => StoriesError(failure: failure),
              success: (stories) {
                if (stories.isEmpty) {
                  return const Center(
                    child: Text(
                      'No stories available',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return StoryViewer(stories: stories);
              },
            );
          },
        ),
      ),
    );
  }
}
