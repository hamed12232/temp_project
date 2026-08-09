import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../domain/entities/request_status_step.dart';
import 'request_status_step_connector.dart';
import 'request_status_step_row.dart';

class RequestStatusStepper extends StatelessWidget {
  const RequestStatusStepper({super.key, required this.steps});

  final List<RequestStatusStep> steps;

  bool _isInactiveStep(RequestStatusStep step) {
    return step.state == RequestStepState.pending &&
        step.timestamp == null &&
        !step.isHighlighted;
  }

  @override
  Widget build(BuildContext context) {
    if (steps.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Center(
          child: Text(
            'No steps to show',
            style: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 12.sp,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    final firstInactiveIndex = steps.indexWhere(_isInactiveStep);
    final railSteps = firstInactiveIndex == -1
        ? steps
        : steps.take(firstInactiveIndex).toList();
    final inactiveSteps = firstInactiveIndex == -1
        ? const <RequestStatusStep>[]
        : steps.skip(firstInactiveIndex).toList();

    return Column(
      children: [
        if (railSteps.isNotEmpty)
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: -5.h,
                bottom: 0,
                child: Container(
                  width: 24.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.pill),
                      topRight: Radius.circular(AppRadius.pill),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.primaryTint15, AppColors.surfaceMuted],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  for (var i = 0; i < railSteps.length; i++)
                    RequestStatusStepRow(
                      step: railSteps[i],
                      nextStep: i == railSteps.length - 1
                          ? null
                          : railSteps[i + 1],
                      isLast: i == railSteps.length - 1,
                    ),
                ],
              ),
            ],
          ),
        for (var i = 0; i < inactiveSteps.length; i++) ...[
          if (railSteps.isNotEmpty || i > 0)
            Padding(
              padding: EdgeInsets.fromLTRB(2.w, 5.h, 0, 5.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                    child: const RequestStatusStepConnector(isInactive: true),
                  ),
                ],
              ),
            ),
          RequestStatusStepRow(
            step: inactiveSteps[i],
            nextStep: i == inactiveSteps.length - 1
                ? null
                : inactiveSteps[i + 1],
            isLast: i == inactiveSteps.length - 1,
          ),
        ],
      ],
    );
  }
}
