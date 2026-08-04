import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadEmptyState extends StatelessWidget {
  final VoidCallback onTap;

  const UploadEmptyState({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 220.w,
          padding: EdgeInsets.symmetric(vertical: 40.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.3),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20.r),
            color: colorScheme.surfaceContainerLow,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                size: 48.sp,
                color: colorScheme.primary,
              ),
              SizedBox(height: 12.h),
              Text(
                'Tap to add images',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
