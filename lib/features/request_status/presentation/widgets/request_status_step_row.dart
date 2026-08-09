import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/request_status_step.dart';
import 'request_status_step_connector.dart';
import 'request_status_step_icon.dart';

class RequestStatusStepRow extends StatelessWidget {
  const RequestStatusStepRow({
    super.key,
    required this.step,
    required this.nextStep,
    required this.isLast,
  });

  final RequestStatusStep step;
  final RequestStatusStep? nextStep;
  final bool isLast;

  bool get _isCompleted => step.state == RequestStepState.completed;
  bool get _isInactive =>
      step.state == RequestStepState.pending &&
      step.timestamp == null &&
      !step.isHighlighted;
  bool get _connectsToInactive =>
      nextStep?.state == RequestStepState.pending &&
      nextStep?.timestamp == null &&
      nextStep?.isHighlighted == false;

  @override
  Widget build(BuildContext context) {
    final titleColor = _isInactive
        ? AppColors.textSecondary
        : (step.isHighlighted
            ? AppColors.textPrimary
            : (_isCompleted ? AppColors.textBodyAlt : AppColors.textPrimary));
    final descriptionColor = _isInactive
        ? AppColors.textSecondary.withValues(alpha: 0.85)
        : AppColors.textSecondary;

    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 0 : 20.h,
        left: 2.w,
        right: 2.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              RequestStatusStepIcon(
                isCompleted: _isCompleted,
                isInactive: _isInactive,
              ),
              if (!isLast)
                Padding(
                  padding: EdgeInsets.only( top: 12.h, bottom: 1.h),
                  child: RequestStatusStepConnector(
                    isInactive: _connectsToInactive,
                  ),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  step.description,
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: descriptionColor,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          if (step.timestamp != null) ...[
            SizedBox(width: 8.w),
            Text(
              step.timestamp!,
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
