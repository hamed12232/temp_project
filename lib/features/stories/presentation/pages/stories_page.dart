import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../cubit/stories_cubit.dart';
import '../cubit/stories_state.dart';
import '../widgets/story_item_widget.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<StoriesCubit>()..fetchStories(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stories'),
          centerTitle: true,
        ),
        body: BlocBuilder<StoriesCubit, StoriesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              error: (failure) => Center(
                child: Padding(
                  padding: EdgeInsets.all(24.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        size: 48.sp,
                        color: Colors.red,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        failure.message,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton.icon(
                        onPressed: () =>
                            context.read<StoriesCubit>().fetchStories(),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
              success: (stories) {
                if (stories.isEmpty) {
                  return const Center(
                    child: Text('No stories available'),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return StoryItemWidget(story: stories[index]);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
