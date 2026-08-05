import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/story.dart';

class StoryItemWidget extends StatelessWidget {
  final Story story;

  const StoryItemWidget({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMediaContent(context),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        story.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    _buildTimeBadge(context),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  story.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    fontSize: 13.sp,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaContent(BuildContext context) {
    if (story.type == StoryType.video) {
      return Container(
        height: 200.h,
        width: double.infinity,
        color: Colors.grey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.play_circle_fill_rounded,
              size: 48.sp,
              color: Colors.white70,
            ),
            SizedBox(height: 8.h),
            Text(
              'Video Placeholder',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: story.mediaUrl,
      height: 200.h,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        height: 200.h,
        color: Colors.grey.shade200,
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: 200.h,
        color: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.broken_image_outlined, size: 36.sp, color: Colors.grey),
            SizedBox(height: 4.h),
            Text('Failed to load image', style: TextStyle(fontSize: 11.sp)),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeBadge(BuildContext context) {
    final formattedTime = [
      if (story.publishDate.isNotEmpty) story.publishDate,
      if (story.time.isNotEmpty) story.time,
    ].join(' • ');

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.access_time_rounded, size: 12.sp, color: Colors.grey.shade600),
        SizedBox(width: 4.w),
        Text(
          formattedTime.isNotEmpty ? formattedTime : 'Recently',
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
