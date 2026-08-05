import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temp_project/core/network/error/failure.dart';
import 'package:temp_project/features/stories/presentation/cubit/stories_cubit.dart';

class StoriesError extends StatelessWidget {
  const StoriesError({super.key, required this.failure});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 48.sp,
              color: Colors.redAccent,
            ),
            SizedBox(height: 12.h),
            Text(
              failure.message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
            SizedBox(height: 16.h),
            ElevatedButton.icon(
              onPressed: () => context.read<StoriesCubit>().fetchStories(),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
