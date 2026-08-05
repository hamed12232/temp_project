import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized typography styles using `google_fonts` following design specs.
abstract class AppStyles {
  const AppStyles._();

  /// Header Title Prefix ("Legalive"): Domine, Regular (400), 20px, 20px line height (1.0)
  static TextStyle get storyHeaderTitleLegalive => GoogleFonts.domine(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        height: 1.0,
        letterSpacing: 0,
        color: Colors.white,
        shadows: const [
          Shadow(
            blurRadius: 4,
            color: Colors.black45,
            offset: Offset(0, 1),
          ),
        ],
      );

  /// Header Title Suffix ("Stories"): DM Sans, Regular (400), 20px, 20px line height (1.0)
  static TextStyle get storyHeaderTitleStories => GoogleFonts.dmSans(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        height: 1.0,
        letterSpacing: 0,
        color: Colors.white,
        shadows: const [
          Shadow(
            blurRadius: 4,
            color: Colors.black45,
            offset: Offset(0, 1),
          ),
        ],
      );

  /// Story Description Body: Domine, Regular (400), 14px, 20px line height (1.428)
  static TextStyle get storyDescription => GoogleFonts.domine(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        letterSpacing: 0,
        color: Colors.white.withValues(alpha: 0.95),
        shadows: const [
          Shadow(
            blurRadius: 6,
            color: Colors.black54,
            offset: Offset(0, 2),
          ),
        ],
      );

  /// Story Timestamp ("2h"): DM Sans, Regular (400), 12px
  static TextStyle get storyTimestamp => GoogleFonts.dmSans(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0,
        color: Colors.white70,
        shadows: const [
          Shadow(
            blurRadius: 4,
            color: Colors.black45,
            offset: Offset(0, 1),
          ),
        ],
      );
}
