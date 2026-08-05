import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SmoothUploadProgressOverlay extends StatefulWidget {
  final double progress;

  const SmoothUploadProgressOverlay({
    super.key,
    required this.progress,
  });

  @override
  State<SmoothUploadProgressOverlay> createState() =>
      _SmoothUploadProgressOverlayState();
}

class _SmoothUploadProgressOverlayState
    extends State<SmoothUploadProgressOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double _targetProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _targetProgress =
        widget.progress < 0.0 ? 0.0 : widget.progress.clamp(0.0, 1.0);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 90),
    );
    _animation = AlwaysStoppedAnimation<double>(_targetProgress);
  }

  @override
  void didUpdateWidget(covariant SmoothUploadProgressOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.progress != oldWidget.progress) {
      _animateToNewProgress(widget.progress);
    }
  }

  void _animateToNewProgress(double newRawProgress) {
    if (newRawProgress < 0.0) return;

    final double newTarget = newRawProgress.clamp(0.0, 1.0);

    // Ignore duplicate progress updates or negligible changes
    if ((newTarget - _targetProgress).abs() < 0.0001) return;

    // Capture the exact visible animated value (prevents jumps from previous target or 0)
    final double currentVisible = _animation.value;

    // Safely stop any running animation
    if (_controller.isAnimating) {
      _controller.stop();
    }

    // Adaptive smoothing strategy based on progress jump size (delta)
    final double delta = (newTarget - currentVisible).abs();
    Duration duration;
    Curve curve;

    if (delta > 0.30) {
      // Large jump or small file instant upload (e.g., 0% -> 100%)
      duration = const Duration(milliseconds: 600);
      curve = Curves.easeOutCubic;
    } else if (delta >= 0.10) {
      // Medium jump (10% - 30%)
      duration = const Duration(milliseconds: 250);
      curve = Curves.easeOutQuad;
    } else {
      // Small incremental update (< 10%) for large files with frequent Dio updates
      duration = const Duration(milliseconds: 90);
      curve = Curves.linear;
    }

    _targetProgress = newTarget;
    _controller.duration = duration;

    _animation = Tween<double>(
      begin: currentVisible,
      end: newTarget,
    ).animate(
      CurvedAnimation(parent: _controller, curve: curve),
    );

    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isIndeterminate = widget.progress < 0.0;

    return Container(
      color: Colors.black.withValues(alpha: 0.55),
      child: Center(
        child: isIndeterminate
            ? SizedBox(
                width: 36.r,
                height: 36.r,
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                ),
              )
            : AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final double val = _animation.value.clamp(0.0, 1.0);
                  final int displayPercent = (val * 100).toInt();

                  return CircularPercentIndicator(
                    radius: 28.r,
                    lineWidth: 4.w,
                    percent: val,
                    progressColor: Colors.white,
                    backgroundColor: Colors.white24,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      '$displayPercent%',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
