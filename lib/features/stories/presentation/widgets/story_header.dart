import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/story.dart';
import 'story_text_animator.dart';

class StoryHeader extends StatelessWidget {
  final Story story;
  final VoidCallback? onClose;
  final VoidCallback? onActionTap;

  const StoryHeader({
    super.key,
    required this.story,
    this.onClose,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime = [
      if (story.publishDate.isNotEmpty) story.publishDate,
      if (story.time.isNotEmpty) story.time,
    ].join(' • ');

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSplitTitle(),
                SizedBox(height: 2.h),
                StoryTextAnimator(
                  beginOffset: const Offset(0.0, 8),
                  child: Text(
                    key: ValueKey('time_${story.id}'),
                    formattedTime.isNotEmpty ? formattedTime : '2h',
                    style: AppStyles.storyTimestamp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: onActionTap ?? onClose,
            child: Assets.images.addIcon.image(
              width: 30.r,
              height: 30.r,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSplitTitle() {
    final fullTitle = story.title.isNotEmpty ? story.title : 'Legalive Stories';

    if (fullTitle.contains(' ')) {
      final spaceIndex = fullTitle.indexOf(' ');
      final prefix = fullTitle.substring(0, spaceIndex + 1);
      final suffix = fullTitle.substring(spaceIndex + 1);

      return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(text: prefix, style: AppStyles.storyHeaderTitleLegalive),
            TextSpan(text: suffix, style: AppStyles.storyHeaderTitleStories),
          ],
        ),
      );
    }

    return Text(
      fullTitle,
      style: AppStyles.storyHeaderTitleLegalive,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
