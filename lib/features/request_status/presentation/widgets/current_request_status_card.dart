import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/request_status_step.dart';
import 'request_status_filter_tabs.dart';
import 'request_status_stepper.dart';
import 'request_status_svg_icon.dart';

class CurrentRequestStatusCard extends StatefulWidget {
  const CurrentRequestStatusCard({
    super.key,
    required this.steps,
  });

  final List<RequestStatusStep> steps;

  @override
  State<CurrentRequestStatusCard> createState() =>
      _CurrentRequestStatusCardState();
}

class _CurrentRequestStatusCardState extends State<CurrentRequestStatusCard> {
  RequestStatusFilter _selectedFilter = RequestStatusFilter.completed;

  int get _completedCount =>
      widget.steps.where((s) => s.state == RequestStepState.completed).length;

  int get _pendingCount =>
      widget.steps.where((s) => s.state == RequestStepState.pending).length;

  List<RequestStatusStep> get _filteredSteps {
    if (_selectedFilter == RequestStatusFilter.completed) {
      return widget.steps;
    }

    return widget.steps.where((step) {
      return step.state == RequestStepState.pending;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(19.w, 21.h, 23.w, 26.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: AppRadius.lgAltAll,
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RequestStatusSvgIcon(
                asset: Assets.images.requestStatus.arrangeSquare.path,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Current request status',
                  style: AppTextStyles.titleSection.copyWith(fontSize: 16.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          RequestStatusSvgIcon(
            asset: Assets.images.requestStatus.dividerLine.path,
            width: double.infinity,
            height: 1.h,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 12.h),
          RequestStatusFilterTabs(
            selectedFilter: _selectedFilter,
            completedCount: _completedCount,
            pendingCount: _pendingCount,
            onFilterChanged: (filter) {
              setState(() => _selectedFilter = filter);
            },
          ),
          SizedBox(height: 16.h),
          RequestStatusStepper(steps: _filteredSteps),
        ],
      ),
    );
  }
}
