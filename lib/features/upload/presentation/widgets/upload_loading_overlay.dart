import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UploadLoadingOverlay extends StatelessWidget {
  final double uploadProgress;

  const UploadLoadingOverlay({
    super.key,
    required this.uploadProgress,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isIndeterminate = uploadProgress < 0.0;
    final clampedProgress = uploadProgress.clamp(0.0, 1.0);
    final percentageInt = (clampedProgress * 100).toInt();

    return Container(
      color: Colors.black38,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(28.r),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 24,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isIndeterminate)
                SizedBox(
                  width: 64.r,
                  height: 64.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 4.w,
                    color: colorScheme.primary,
                  ),
                )
              else
                CircularPercentIndicator(
                  radius: 50.r,
                  lineWidth: 6.w,
                  percent: clampedProgress,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: colorScheme.primary,
                  backgroundColor: colorScheme.surfaceContainerHighest,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    '$percentageInt%',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              SizedBox(height: 16.h),
              Text(
                isIndeterminate
                    ? 'Uploading images...'
                    : 'Uploading... ($percentageInt%)',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
