import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/request_status_step.dart';
import 'request_status_svg_icon.dart';

class RequestStatusFilterTabs extends StatelessWidget {
  const RequestStatusFilterTabs({
    super.key,
    required this.selectedFilter,
    required this.completedCount,
    required this.pendingCount,
    required this.onFilterChanged,
  });

  final RequestStatusFilter selectedFilter;
  final int completedCount;
  final int pendingCount;
  final ValueChanged<RequestStatusFilter> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FilterTab(
          label: 'Completed',
          count: completedCount,
          isSelected: selectedFilter == RequestStatusFilter.completed,
          onTap: () => onFilterChanged(RequestStatusFilter.completed),
        ),
        SizedBox(width: 8.w),
        _FilterTab(
          label: 'Pending',
          count: pendingCount,
          isSelected: selectedFilter == RequestStatusFilter.pending,
          onTap: () => onFilterChanged(RequestStatusFilter.pending),
        ),
      ],
    );
  }
}

class _FilterTab extends StatelessWidget {
  const _FilterTab({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isSelected ? AppColors.primaryCheckRing : AppColors.checkboxRingIdle;
    final labelColor =
        isSelected ? AppColors.primary : AppColors.textSecondary;
    final verifyAsset = isSelected
        ? Assets.images.requestStatus.verifyFilterCompleted.path
        : Assets.images.requestStatus.verifyFilterPending.path;
    final badgeAsset =
        isSelected ? Assets.images.requestStatus.badgeOrange.path : Assets.images.requestStatus.badgeGrey.path;
    final badgeTextColor =
        isSelected ? AppColors.textOnPrimary : AppColors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 28.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: AppRadius.pillAll,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RequestStatusSvgIcon(
              asset: verifyAsset,
              width: 16.w,
              height: 16.h,
            ),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: labelColor,
                height: 1.4,
              ),
            ),
            SizedBox(width: 8.w),
            SizedBox(
              width: 18.r,
              height: 18.r,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  RequestStatusSvgIcon(
                    asset: badgeAsset,
                    width: 18.r,
                    height: 18.r,
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: badgeTextColor,
                      height: 1,
                    ),
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
