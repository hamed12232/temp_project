import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import 'request_status_svg_icon.dart';

class RequestInfoRow {
  const RequestInfoRow({required this.label, required this.value});

  final String label;
  final String value;
}

class RequestInfoCard extends StatelessWidget {
  const RequestInfoCard({
    super.key,
    required this.rows,
  });

  final List<RequestInfoRow> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: AppRadius.lgAltAll,
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      rows[i].label,
                      style: AppTextStyles.fieldLabel.copyWith(fontSize: 14.sp),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      rows[i].value,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.fieldValue.copyWith(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ),
            if (i < rows.length - 1)
              RequestStatusSvgIcon(
                asset: Assets.images.requestStatus.dividerLine.path,
                width: double.infinity,
                height: 1.h,
                fit: BoxFit.fill,
              ),
          ],
        ],
      ),
    );
  }
}
