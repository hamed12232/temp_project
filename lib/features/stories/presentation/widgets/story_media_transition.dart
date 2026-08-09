import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/story.dart';
import 'story_video_player.dart';

/// Reusable widget managing ultra-fast media transition (150ms)
/// without scaling, sliding, or interrupting video playback.
class StoryMediaTransition extends StatelessWidget {
  final Story story;
  final bool isPaused;
  final ValueChanged<Duration>? onVideoInitialized;
  final ValueChanged<Duration>? onPositionChanged;
  final VoidCallback? onVideoEnded;

  const StoryMediaTransition({
    super.key,
    required this.story,
    this.isPaused = false,
    this.onVideoInitialized,
    this.onPositionChanged,
    this.onVideoEnded,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher( // بيخلي الستاك يتغير بسلاسه من غير اي حركة بيستجاب اول ما المحتوي يتغير
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Container(
        key: ValueKey(story.id),
        color: Colors.black,
        child: _buildMediaContent(),
      ),
    );
  }

  Widget _buildMediaContent() {
    if (story.type == StoryType.video) {
      return StoryVideoPlayer(
        story: story,
        isPaused: isPaused,
        onVideoInitialized: (duration) => onVideoInitialized?.call(duration),
        onPositionChanged: (position) => onPositionChanged?.call(position),
        onVideoEnded: onVideoEnded,
      );
    }

    return CachedNetworkImage(
      imageUrl: story.mediaUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.black87,
        child: const SizedBox.shrink(),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.broken_image_rounded,
              size: 48.sp,
              color: Colors.white54,
            ),
            SizedBox(height: 8.h),
            Text(
              'Unable to load story image',
              style: TextStyle(color: Colors.white54, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
