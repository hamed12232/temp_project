import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../gen/assets.gen.dart';
import 'request_status_svg_icon.dart';

class RequestStatusStepConnector extends StatelessWidget {
  const RequestStatusStepConnector({super.key, required this.isInactive});

  final bool isInactive;

  @override
  Widget build(BuildContext context) {
    if (!isInactive) {
      return RequestStatusSvgIcon(
        asset: Assets.images.requestStatus.stepConnector.path,
        height: 22.h,
      );
    }

    return SizedBox(
      width: 3.w,
      height: 20.h,
      child: CustomPaint(
        painter: _DashedConnectorPainter(color: AppColors.borderDefault),
      ),
    );
  }
}

class _DashedConnectorPainter extends CustomPainter {
  const _DashedConnectorPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    final x = size.width / 2;
    var y = 0.5;

    while (y < size.height) {
      final endY = (y + 2.5).clamp(0, size.height);
      canvas.drawLine(Offset(x, y), Offset(x, endY.toDouble()), paint);
      y += 5;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedConnectorPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
