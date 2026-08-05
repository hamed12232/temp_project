import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/story.dart';
import 'story_header.dart';
import 'story_progress_bar.dart';
import 'story_view_item.dart';

class StoryViewer extends StatefulWidget {
  final List<Story> stories;
  final int initialIndex;

  const StoryViewer({
    super.key,
    required this.stories,
    this.initialIndex = 0,
  });

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
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

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextStory();
      }
    });

    _startStory();
  }

  void _startStory() {
    _animController.stop();
    _animController.reset();

    if (widget.stories.isEmpty) return;

    final currentStory = widget.stories[_currentIndex];
    _animController.duration = currentStory.effectiveImageDuration;

    if (!_isPaused) {
      _animController.forward();
    }
  }

  void _nextStory() {
    if (_currentIndex < widget.stories.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _startStory();
    } else {
      _animController.stop();
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  void _previousStory() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _startStory();
    } else {
      _startStory();
    }
  }

  void _pause() {
    if (!_isPaused) {
      setState(() {
        _isPaused = true;
      });
    }
    if (_animController.isAnimating) {
      _animController.stop();
    }
  }

  void _resume() {
    if (_isPaused) {
      setState(() {
        _isPaused = false;
      });
    }
    if (!_animController.isAnimating) {
      _animController.forward();
    }
  }

  void _handleTapDown(TapDownDetails details) {
    _pressStartTime = DateTime.now();
    _tapPosition = details.globalPosition;
    _pause();
  }

  void _handleTapUp(TapUpDetails details) {
    _resume();

    if (_pressStartTime != null && _tapPosition != null) {
      final pressDuration = DateTime.now().difference(_pressStartTime!);

      // Only navigate if it was a quick tap (< 250ms), otherwise treat as long-press release
      if (pressDuration.inMilliseconds < 250) {
        final screenWidth = MediaQuery.of(context).size.width;
        if (_tapPosition!.dx < screenWidth / 2) {
          _previousStory();
        } else {
          _nextStory();
        }
      }
    }

    _pressStartTime = null;
    _tapPosition = null;
  }

  void _handleTapCancel() {
    _resume();
    _pressStartTime = null;
    _tapPosition = null;
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.stories.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'No stories available',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    final currentStory = widget.stories[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Story Item
            StoryViewItem(
              story: currentStory,
              isPaused: _isPaused,
            ),

            // Top Progress Bar and Header Overlay
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
                    animation: _animController,
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
