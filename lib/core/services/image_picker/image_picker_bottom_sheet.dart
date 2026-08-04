import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_picker_result.dart';

/// Returns [ImagePickerSource] or null if dismissed. Pure UI, no picking logic.
Future<ImagePickerSource?> showImagePickerBottomSheet(
  BuildContext context,
) async {
  return showModalBottomSheet<ImagePickerSource>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (context) => const _ImagePickerSheet(),
  );
}

class _ImagePickerSheet extends StatelessWidget {
  const _ImagePickerSheet();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
      child: Material(
        color: colorScheme.surface,
        elevation: 18,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(28.r),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose Photo Source',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                SizedBox(height: 6.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pick a new photo from gallery or camera',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.35,
                        ),
                  ),
                ),
                SizedBox(height: 20.h),
                _ImageSourceTile(
                  icon: Icons.photo_library_outlined,
                  title: 'Photo Gallery',
                  subtitle: 'Choose from existing photos',
                  backgroundColor: isDark
                      ? colorScheme.surfaceContainerHigh
                      : colorScheme.surfaceContainerLow,
                  borderColor: colorScheme.outlineVariant,
                  iconColor: colorScheme.primary,
                  onTap: () =>
                      Navigator.of(context).pop(ImagePickerSource.gallery),
                ),
                SizedBox(height: 12.h),
                _ImageSourceTile(
                  icon: Icons.camera_alt_outlined,
                  title: 'Camera',
                  subtitle: 'Take a new photo',
                  backgroundColor:
                      colorScheme.primaryContainer.withValues(alpha: 0.3),
                  borderColor: colorScheme.primary.withValues(alpha: 0.18),
                  iconColor: colorScheme.primary,
                  onTap: () =>
                      Navigator.of(context).pop(ImagePickerSource.camera),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageSourceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final VoidCallback onTap;

  const _ImageSourceTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              Container(
                width: 44.r,
                height: 44.r,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 22.sp),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style:
                          Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14.sp,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
