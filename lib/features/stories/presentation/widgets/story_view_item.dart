import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/story.dart';

class StoryViewItem extends StatelessWidget {
  final Story story;
  final bool isPaused;

  const StoryViewItem({
    super.key,
    required this.story,
    this.isPaused = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Media Image
        _buildMediaContent(),

        // Top dark gradient overlay for header and progress bar readability
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 160.h,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        // Bottom dark gradient overlay for description text readability
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 240.h,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        // Bottom description text matching screenshot typography
        Positioned(
          bottom: 40.h,
          left: 20.w,
          right: 20.w,
          child: Text(
            story.description,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.95),
              fontSize: 14.sp,
              height: 1.45,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.2,
              shadows: const [
                Shadow(
                  blurRadius: 6,
                  color: Colors.black54,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildMediaContent() {
    return CachedNetworkImage(
      imageUrl: story.mediaUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.black87,
        child: const Center(
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
          ),
        ),
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
