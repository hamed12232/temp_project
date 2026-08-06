import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';


/// - **DM Sans** (Light / Regular / Medium / SemiBold / Bold / Black) —
/// - **Domine** (Bold) — reserved for accent phrases inside headlines
///   (e.g. "...your **Power of Attorney**?", "**Powers to Grant.**")
///   and a couple of card titles ("Get notarized doc").
/// - **Poppins** (SemiBold) — used only for the status-bar clock.

class AppTextStyles {
  AppTextStyles._();

  // ---------------------------------------------------------------------
  // Display / Headline (DM Sans)
  // ---------------------------------------------------------------------

  /// Hero heading, e.g. "How can we help with your Power of Attorney?"
  /// 36 / 40, SemiBold.
  static TextStyle get displayHero => GoogleFonts.dmSans(
        fontSize: 36,
        height: 40 / 36,
        fontWeight: FontWeight.w600,
        color: AppColors.textBody,
      );

  /// Page-level heading used on content screens, e.g.
  /// "Power of Attorney · Buying Property". 32 / 40, Medium.
  static TextStyle get displayPage => GoogleFonts.dmSans(
        fontSize: 32,
        height: 40 / 32,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  /// Confirmation-screen large heading, e.g. "Your request is now in
  /// progress". 32 / 40, SemiBold.
  static TextStyle get displayConfirmation => GoogleFonts.dmSans(
        fontSize: 32,
        height: 40 / 32,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  /// Flow-step heading, e.g. "Power of Attorney Contact &
  /// Notarization" / "Select the Powers to Grant.". 27 / normal,
  /// Medium, with the accent phrase set in [displayAccent].
  static TextStyle get displayStep => GoogleFonts.dmSans(
        fontSize: 27,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  /// Screen / nav-bar title. 20 / 20, Medium.
  static TextStyle get titleLarge => GoogleFonts.dmSans(
        fontSize: 20,
        height: 20 / 20,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  /// Card / list-item title. 18 / 20, Medium.
  static TextStyle get titleMedium => GoogleFonts.dmSans(
        fontSize: 18,
        height: 20 / 18,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  /// Section title with a leading accent-bar (e.g. "Documents to
  /// prepare", "How it works"). 16 / normal, SemiBold.
  static TextStyle get titleSection => GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  // ---------------------------------------------------------------------
  // Display accents (Domine)
  // ---------------------------------------------------------------------

  /// Bold serif accent phrase embedded inside a [displayHero] or
  /// [displayStep] headline (e.g. "Power of Attorney" / "Powers to
  /// Grant."). Inherits size/height from the base style — pass the
  /// base style's `fontSize`/`height` explicitly if used standalone.
  static TextStyle domineAccent({
    required double fontSize,
    double? height,
    Color color = AppColors.primary,
  }) =>
      GoogleFonts.domine(
        fontSize: fontSize,
        height: height,
        fontWeight: FontWeight.w700,
        color: color,
      );

  /// Card title set in Domine Bold (e.g. "Get notarized doc").
  static TextStyle get titleDomine => GoogleFonts.domine(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  // ---------------------------------------------------------------------
  // Body (DM Sans)
  // ---------------------------------------------------------------------

  /// Standard body / option-row text. 16 / 20, Medium.
  static TextStyle get bodyLarge => GoogleFonts.dmSans(
        fontSize: 16,
        height: 20 / 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  /// Subtitle / instruction text under a hero heading. 16 / 32, Medium.
  static TextStyle get bodySubtitle => GoogleFonts.dmSans(
        fontSize: 16,
        height: 32 / 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
      );

  /// Paragraph copy under a [displayPage] / [displayStep] heading.
  /// 13–16 / normal, Regular. Use [bodyParagraphSmall] for the 13px
  /// variant.
  static TextStyle get bodyParagraph => GoogleFonts.dmSans(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textBody,
      );

  /// Smaller paragraph copy (form/checklist screen descriptions).
  /// 13 / normal, Regular.
  static TextStyle get bodyParagraphSmall => GoogleFonts.dmSans(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.3,
      );

  /// Standard pill-button / chip label. 14 / 20, Medium.
  static TextStyle get bodyMedium => GoogleFonts.dmSans(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textOnPrimary,
      );

  /// Checklist item title (14px Medium) — pair with
  /// [bodyChecklistDescription] for the 12px description below it.
  static TextStyle get bodyChecklistTitle => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  /// Checklist item description. 12 / normal, Regular.
  static TextStyle get bodyChecklistDescription => GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.3,
      );

  /// Card description copy. 11 / 15, Light.
  static TextStyle get bodySmall => GoogleFonts.dmSans(
        fontSize: 11,
        height: 15 / 11,
        fontWeight: FontWeight.w300,
        color: AppColors.textSecondary,
      );

  // ---------------------------------------------------------------------
  // Buttons
  // ---------------------------------------------------------------------

  /// Primary pill-button label. 16 / normal, Bold.
  static TextStyle get button => GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.textOnPrimary,
      );

  // ---------------------------------------------------------------------
  // Label / caption
  // ---------------------------------------------------------------------

  /// Footnote / support-link text. 12 / 20, Medium.
  static TextStyle get labelMedium => GoogleFonts.dmSans(
        fontSize: 12,
        height: 20 / 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textTertiary,
      );

  /// Small chip label (e.g. "Chat"). 8 / 20, Medium.
  static TextStyle get labelSmall => GoogleFonts.dmSans(
        fontSize: 8,
        height: 20 / 8,
        fontWeight: FontWeight.w500,
        color: AppColors.textOnPrimary,
      );

  /// Field / row label paired with a value (e.g. "Service",
  /// "Status", "Request ID"). 14 / normal, Regular.
  static TextStyle get fieldLabel => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  /// Field value paired with [fieldLabel]. 14 / normal, Medium.
  static TextStyle get fieldValue => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textBodyAlt,
        height: 1.4,
      );

  /// Floating input label (e.g. "Email Address", "Phone Number").
  /// 12 / 16, Medium, tight tracking.
  static TextStyle get inputLabel => GoogleFonts.dmSans(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textLabel,
        letterSpacing: -0.2,
      );

  /// Input placeholder / value text. 14 / 24, Regular, tight tracking.
  static TextStyle get inputText => GoogleFonts.dmSans(
        fontSize: 14,
        height: 24 / 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        letterSpacing: -0.3,
      );

  /// Status-bar clock. 15 / 20, SemiBold, Poppins.
  static TextStyle get statusBarTime => GoogleFonts.poppins(
        fontSize: 15,
        height: 20 / 15,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: AppColors.textNeutral1000,
      );
//stories
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

  // ---------------------------------------------------------------------
  // Emphasis helpers
  // ---------------------------------------------------------------------

  /// Applies the brand-orange accent color to any base style, for
  /// inline highlighted spans set in the *same* font as the base
  /// (e.g. "Recommended" prefix, category-tag text).
  static TextStyle accent(TextStyle base) =>
      base.copyWith(color: AppColors.primary);

  /// Underlined accent variant, used for inline links
  /// (e.g. "Legalive Support").
  static TextStyle accentLink(TextStyle base) => base.copyWith(
        color: AppColors.primary,
        decoration: TextDecoration.underline,
      );
}
