import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryProgressBar extends StatelessWidget {
  final int count;
  final int currentIndex;
  final Animation<double> animation;

  const StoryProgressBar({
    super.key,
    required this.count,
    required this.currentIndex,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: List.generate(count, (index) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2.r),
                child: _SegmentBar(
                  height: 3.h,
                  index: index,
                  currentIndex: currentIndex,
                  animation: animation,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _SegmentBar extends StatelessWidget {
  final double height;
  final int index;
  final int currentIndex;
  final Animation<double> animation;

  const _SegmentBar({
    required this.height,
    required this.index,
    required this.currentIndex,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.white.withValues(alpha: 0.35),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double factor = 0.0;
          if (index < currentIndex) {
            factor = 1.0;
          } else if (index == currentIndex) {
            factor = animation.value.clamp(0.0, 1.0);
          } else {
            factor = 0.0;
          }

          return FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: factor,
            child: Container(
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
