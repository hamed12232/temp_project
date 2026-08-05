import 'package:flutter/material.dart';

/// Highly customizable animation widget to animate any text or widget
/// with Slide and Fade transitions across different story components.
class StoryTextAnimator extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Offset beginOffset;
  final Offset endOffset;
  final Curve switchInCurve;
  final Curve switchOutCurve;

  const StoryTextAnimator({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds:900),
    this.beginOffset = const Offset(0.0, -8),
    this.endOffset = Offset.zero,
    this.switchInCurve = Curves.easeOut,
    this.switchOutCurve = Curves.easeIn,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: (Widget animationChild, Animation<double> animation) {
        final slideAnimation = Tween<Offset>(
          begin: beginOffset,
          end: endOffset,
        ).animate(animation);

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: slideAnimation,
            child: animationChild,
          ),
        );
      },
      child: child,
    );
  }
}
