import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/request_status_step.dart';
import '../widgets/current_request_status_card.dart';
import '../widgets/request_info_card.dart';
import '../widgets/request_status_svg_icon.dart';

class RequestStatusPage extends StatelessWidget {
  const RequestStatusPage({super.key});

  static const List<RequestStatusStep> _sampleSteps = [
    RequestStatusStep(
      title: 'Draft created',
      description: 'Your POA draft has been prepared.',
      state: RequestStepState.completed,
      timestamp: '08:15 AM',
    ),
    RequestStatusStep(
      title: 'Waiting for your approval',
      description: 'Please review your draft and confirm the details.',
      state: RequestStepState.completed,
      timestamp: '08:17 AM',
    ),
    RequestStatusStep(
      title: 'Edits Requested',
      description: 'Your Requests To Edits Will Be Considered.',
      state: RequestStepState.completed,
      timestamp: '08:20 AM',
    ),
    RequestStatusStep(
      title: 'Waiting For Your Approval',
      description: 'Please review your draft and confirm the details.',
      state: RequestStepState.pending,
      timestamp: '08:20 AM',
      isHighlighted: true,
    ),
    RequestStatusStep(
      title: 'With notary for review',
      description: 'Your approved draft has been sent to the notary.',
      state: RequestStepState.pending,
      timestamp: '08:20 AM',
    ),
    RequestStatusStep(
      title: 'Reserve Meeting',
      description:
          'Select an available appointment slot to proceed with your notarization.',
      state: RequestStepState.pending,
      timestamp: '08:20 AM',
      isHighlighted: true,
    ),
    RequestStatusStep(
      title: 'Payment & Confirmation',
      description:
          'Review your payment details and complete the transaction to confirm your service.',
      state: RequestStepState.pending,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _RequestStatusHeader(
              onBack: () => Navigator.of(context).maybePop(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(23.w, 14.h, 23.w, 0),
                child: Column(
                  children: [
                    const RequestInfoCard(
                      rows: [
                        RequestInfoRow(
                          label: 'Service',
                          value: 'POa ,Buying Property',
                        ),
                        RequestInfoRow(
                          label: 'Status',
                          value: 'Waiting for your review',
                        ),
                        RequestInfoRow(
                          label: 'Request ID',
                          value: 'LEG-2025-0123412 Dec 2025',
                        ),
                      ],
                    ),
                    SizedBox(height: 9.h),
                    const CurrentRequestStatusCard(steps: _sampleSteps),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _ContinueButton(onPressed: () {}),
    );
  }
}

class _RequestStatusHeader extends StatelessWidget {
  const _RequestStatusHeader({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(23.w, 0, 24.w, 14.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.borderSubtle, width: 0.5),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 36.r,
              height: 36.r,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  RequestStatusSvgIcon(
                    asset: Assets.images.requestStatus.arrowBackSquare.path,
                    width: 36.r,
                    height: 36.r,
                  ),
                  RequestStatusSvgIcon(
                    asset: Assets.images.requestStatus.arrowBackChevron.path,
                    width: 16.w,
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Request status',
              textAlign: TextAlign.center,
              style: AppTextStyles.titleLarge.copyWith(fontSize: 20.sp),
            ),
          ),
          Container(
            width: 76.w,
            height: 30.h,

            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RequestStatusSvgIcon(
                  asset: Assets.images.requestStatus.chatIcon.path,
                  width: 25.w,
                  height: 25.h,
                ),
                Container(
                  width: 45.w,
                  height: 22.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.borderSubtle,
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Text(
                    'Chat',
                    style: AppTextStyles.labelSmall.copyWith(fontSize: 8.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(37.r),
          topRight: Radius.circular(37.r),
        ),
        border: Border(
          top: BorderSide(color: AppColors.borderLight, width: 0.5),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Material(
          color: AppColors.primary,
          borderRadius: AppRadius.pillAll,
          child: InkWell(
            onTap: onPressed,
            borderRadius: AppRadius.pillAll,
            child: Container(
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: AppRadius.pillAll,
                border: Border.all(color: AppColors.primary),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.innerHighlight,
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue To Payment',
                    style: AppTextStyles.button.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(width: 8.w),
                  Transform.rotate(
                    angle: 3.14159,
                    child: RequestStatusSvgIcon(
                      asset: Assets.images.requestStatus.arrowForward.path,
                      width: 4.w,
                      height: 10.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
