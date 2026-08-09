import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import 'request_status_svg_icon.dart';

class RequestStatusStepIcon extends StatelessWidget {
  const RequestStatusStepIcon({
    super.key,
    required this.isCompleted,
    required this.isInactive,
  });

  final bool isCompleted;
  final bool isInactive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: RequestStatusSvgIcon(
          asset: isCompleted
              ? Assets.images.requestStatus.verifyCompleted.path
              : (isInactive
                  ? Assets.images.requestStatus.verifyFilterPending.path
                  : Assets.images.requestStatus.verifyFilterCompleted.path),
          width: 20.w,
          height: 20.h,
        ),
      ),
    );
  }
}
