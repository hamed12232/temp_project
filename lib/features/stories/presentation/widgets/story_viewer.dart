import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temp_project/core/theme/app_text_styles.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/cache/video_cache_service.dart';
import '../../domain/entities/story.dart';
import 'story_header.dart';
import 'story_media_transition.dart';
import 'story_progress_bar.dart';
import 'story_text_animator.dart';

class StoryViewer extends StatefulWidget {
  final List<Story> stories;
  final int initialIndex;

  const StoryViewer({super.key, required this.stories, this.initialIndex = 0});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController
  _progressController; //عامل زي التايمر كده بس بتفاصيل اكتر
  late int _currentIndex;

  bool _isPaused = false;
  DateTime? _pressStartTime;
  Offset? _tapPosition;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(
      0,
      widget.stories.isEmpty ? 0 : widget.stories.length - 1,
    );

    _progressController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              //بيسأل وصلنا لاخر الاستوري ولا لا
              _navigateStory(_currentIndex + 1);
            }
          });

    _startStory();
  }

  void _startStory() {
    _progressController.stop();
    _progressController.reset();

    if (widget.stories.isEmpty) return;

    final currentStory = widget.stories[_currentIndex];
    _preloadNextStory(_currentIndex + 1);

    if (currentStory.type == StoryType.image) {
      _progressController.duration = currentStory.effectiveImageDuration;
      if (!_isPaused) {
        _progressController.forward();
      }
    }
  }

  void _preloadNextStory(int nextIndex) {
    if (nextIndex < widget.stories.length) {
      final nextStory = widget.stories[nextIndex];
      if (nextStory.type == StoryType.image) {
        try {
          precacheImage(
            CachedNetworkImageProvider(nextStory.mediaUrl),
            context,
          );
        } catch (_) {}
      } else if (nextStory.type == StoryType.video) {
        sl<VideoCacheService>().preloadVideo(nextStory.mediaUrl);
      }
    }
  }

  void _navigateStory(int targetIndex) {
    if (widget.stories.isEmpty) return;

    if (targetIndex < 0) {
      _startStory();
      return;
    }

    if (targetIndex >= widget.stories.length) {
      _progressController.stop();
      return;
    }

    setState(() {
      _currentIndex = targetIndex;
    });

    _startStory();
  }

  void _pause() {
    if (!_isPaused) {
      setState(() => _isPaused = true);
    }
    if (_progressController.isAnimating) {
      _progressController.stop();
    }
  }

  void _resume() {
    if (_isPaused) {
      setState(() => _isPaused = false);
    }
    if (!_progressController.isAnimating) {
      _progressController
          .forward(); //بيكمل من المكان اللي وقف عنده مش بيبدء من جديد
    }
  }

  void _handleTapDown(TapDownDetails details) {
    //اول ماالصباع يجي ع الشاشة
    _pressStartTime = DateTime.now();
    _tapPosition = details.globalPosition;
    _pause();
  }

  void _handleTapUp(TapUpDetails details) {
    //اول ما يشيل صباعه
    _resume(); //رجع يكمل تاني
    if (_pressStartTime != null && _tapPosition != null) {
      final pressDuration = DateTime.now().difference(
        _pressStartTime!,
      ); //بيشوف ضغط قد اي
      if (pressDuration.inMilliseconds < 250) {
        //لو اقل من ربع ثانيه يعتبر ضغطه بس عشان يقلب
        final screenWidth = MediaQuery.of(context).size.width;
        if (_tapPosition!.dx < screenWidth / 2) {
          //لو صباعه في النصف الشمال يبقى يرجع لورا
          _navigateStory(_currentIndex - 1);
        } else {
          //لو صباعه في النصف اليمين يبقى يتقدم لادام
          _navigateStory(_currentIndex + 1);
        }
      }
    }
    _pressStartTime = null;
    _tapPosition = null;
  }

  void _onVideoInitialized(Duration videoDuration) {
    if (!mounted) return; //بيتاكد ان اليو اي لسه موجود عشان ميحصلش ايرور
    _progressController.duration =
        videoDuration; //بيدي للبروجرس كنترولر مدة الفيديو
    _progressController.reset();
    if (!_isPaused) {
      _progressController.forward();
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentStory = widget.stories[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque, // بيخلي الجيستشر يسمع كل الضغطات في اي مكان
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: () {// بيعمل ريزيوم لو حصل كسل
          _resume();
          _pressStartTime = null;
          _tapPosition = null;
        },
        child: Stack(
          fit: StackFit.expand, // بيخلي الستاك ياخد مساحة الشاشة كلها
          children: [
            StoryMediaTransition(
              story: currentStory,
              isPaused: _isPaused,
              onVideoInitialized: _onVideoInitialized,
            ),
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
            Positioned(
              bottom: 40.h,
              left: 20.w,
              right: 20.w,
              child: StoryTextAnimator(
                child: Text(
                  key: ValueKey('desc_${currentStory.id}'),
                  currentStory.description,
                  style: AppTextStyles.storyDescription,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 4.h,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StoryProgressBar(
                    count: widget.stories.length,
                    currentIndex: _currentIndex,
                    animation: _progressController,
                  ),
                  StoryHeader(
                    story: currentStory,
                    onClose: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
