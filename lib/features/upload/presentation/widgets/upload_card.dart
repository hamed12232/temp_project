import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/utils/enums/enums.dart';
import '../../domain/entities/upload_item.dart';

class UploadCard extends StatelessWidget {
  final UploadItem item;
  final VoidCallback onRemove;
  final VoidCallback onRetry;

  const UploadCard({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _ImagePreview(item: item),
          if (item.status == UploadItemStatus.uploading)
            _ProgressOverlay(progress: item.progress),
          if (item.status == UploadItemStatus.success) const _SuccessBadge(),
          if (item.status == UploadItemStatus.failure)
            _FailureOverlay(
              message: item.failure?.message ?? 'Upload failed',
              onRetry: onRetry,
            ),
          Positioned(
            top: 6.h,
            right: 6.w,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: EdgeInsets.all(4.r),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close_rounded,
                  size: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  final UploadItem item;

  const _ImagePreview({required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (item.uploadedFile != null && item.uploadedFile!.path.isNotEmpty) {
      return Image.network(
        item.uploadedFile!.path,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            Image.file(File(item.image.path), fit: BoxFit.cover),
      );
    }

    return Image.file(
      File(item.image.path),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        color: colorScheme.surfaceContainerHighest,
        child: Icon(
          Icons.broken_image_outlined,
          color: colorScheme.onSurfaceVariant,
          size: 28.sp,
        ),
      ),
    );
  }
}

class _ProgressOverlay extends StatelessWidget {
  final double progress;

  const _ProgressOverlay({required this.progress});

  @override
  Widget build(BuildContext context) {
    final isIndeterminate = progress < 0.0;
    final targetProgress = progress.clamp(0.0, 1.0);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
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
            : TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: targetProgress),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutCubic,
                builder: (context, animatedValue, child) {
                  final displayPercent = (animatedValue * 100).toInt();

                  return CircularPercentIndicator(
                    radius: 28.r,
                    lineWidth: 4.w,
                    percent: animatedValue.clamp(0.0, 1.0),
                    animation: false,
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

class _SuccessBadge extends StatelessWidget {
  const _SuccessBadge();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 6.h,
      left: 6.w,
      right: 6.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.green.shade800.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 14.sp),
            SizedBox(width: 4.w),
            Flexible(
              child: Text(
                'Uploaded',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FailureOverlay extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _FailureOverlay({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade900.withValues(alpha: 0.7),
      padding: EdgeInsets.all(8.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline_rounded, color: Colors.white, size: 24.sp),
          SizedBox(height: 4.h),
          Text(
            'Failed',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: Icon(Icons.refresh_rounded, size: 12.sp),
            label: Text('Retry', style: TextStyle(fontSize: 10.sp)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.red.shade900,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              minimumSize: Size(0, 24.h),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
