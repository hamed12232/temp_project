import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/cache/video_cache_service.dart';
import '../../domain/entities/story.dart';

class StoryVideoPlayer extends StatefulWidget {
  final Story story;
  final bool isPaused;
  final ValueChanged<Duration> onVideoInitialized;
  final ValueChanged<Duration>? onPositionChanged;
  final VoidCallback? onVideoEnded;

  const StoryVideoPlayer({
    super.key,
    required this.story,
    required this.isPaused,
    required this.onVideoInitialized,
    this.onPositionChanged,
    this.onVideoEnded,
  });

  @override
  State<StoryVideoPlayer> createState() => _StoryVideoPlayerState();
}

class _StoryVideoPlayerState extends State<StoryVideoPlayer> {
  VideoPlayerController? _controller;
  bool _isLoading = true;
  bool _isCached = false;
  bool _isBuffering = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadAndInitializeVideo();
  }

  Future<void> _loadAndInitializeVideo() async {
    try {
      final videoCacheService = sl<VideoCacheService>();
      final File? cached =
          await videoCacheService.getCachedFile(widget.story.mediaUrl);
      final bool isCached = cached != null && cached.existsSync();

      if (mounted) {
        setState(() {
          _isLoading = true;
          _isCached = isCached;
          _hasError = false;
        });
      }

      final File cachedFile = isCached
          ? cached
          : await videoCacheService.getSingleFile(widget.story.mediaUrl);

      if (!mounted) return;

      _controller = VideoPlayerController.file(cachedFile);
      await _controller!.initialize();

      if (!mounted) return;

      _controller!.addListener(_videoListener);

      setState(() {
        _isLoading = false;
      });

      widget.onVideoInitialized(_controller!.value.duration);

      if (!widget.isPaused) {
        _controller!.play();
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    }
  }

  void _videoListener() {
    if (_controller == null || !mounted) return;

    final value = _controller!.value;

    // Ignore buffering indicator when the video is near or at the end
    final bool isNearEnd = value.duration > Duration.zero &&
        (value.position >= value.duration ||
            (value.duration - value.position).inMilliseconds < 300);

    final bool isBuffering = value.isBuffering && !isNearEnd;

    if (isBuffering != _isBuffering) {
      setState(() {
        _isBuffering = isBuffering;
      });
    }

    widget.onPositionChanged?.call(value.position);

    if (value.position >= value.duration && !value.isPlaying) {
      widget.onVideoEnded?.call();
    }
  }

  @override
  void didUpdateWidget(covariant StoryVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller != null && _controller!.value.isInitialized) {
      if (widget.isPaused && !oldWidget.isPaused) {
        _controller!.pause();
      } else if (!widget.isPaused && oldWidget.isPaused) {
        _controller!.play();
      }
    }
  }

  @override
  void dispose() {
    _controller?.removeListener(_videoListener);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        color: Colors.grey.shade900,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline_rounded,
                  size: 48.sp, color: Colors.redAccent),
              SizedBox(height: 8.h),
              Text(
                'Failed to load video',
                style: TextStyle(color: Colors.white70, fontSize: 13.sp),
              ),
              SizedBox(height: 12.h),
              ElevatedButton.icon(
                onPressed: _loadAndInitializeVideo,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_isLoading ||
        _controller == null ||
        !_controller!.value.isInitialized) {
      return Container(
        color: Colors.black,
        child: _isCached
            ? const SizedBox.shrink()
            : const Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
                ),
              ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller!.value.size.width,
            height: _controller!.value.size.height,
            child: VideoPlayer(_controller!),
          ),
        ),

        // Buffering Indicator Overlay
        if (_isBuffering)
          const Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
      ],
    );
  }
}
