import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------
  // Brand
  // ---------------------------------------------------------------------

  /// Primary brand orange. CTAs, active states, links, active pills.
  static const Color primary = Color(0xFFFC6833);

  /// Solid tint used for highlighted chip/card backgrounds (e.g. the
  /// header "Chat" pill, the highlighted "recommended option" card).
  static const Color primaryLight = Color(0xFFFFF0EB);

  /// Softer solid tint used for category tag chips ("Property
  /// Purchase", "Documentation & Contracts").
  static const Color primarySoft = Color(0xFFFDECE6); // ~ #FDAE91 @ 32%

  /// 5% orange wash — subtle banner / notice backgrounds.
  static const Color primaryTint05 = Color(0x0DFC6833);

  /// 10% orange wash — step-icon chips, dashed-outline info cards.
  static const Color primaryTint10 = Color(0x1AFC6833);

  /// 15% orange wash — selected segmented-control / checkbox row bg.
  static const Color primaryTint15 = Color(0x26FC6833);

  /// 20% orange wash — small circular icon backgrounds.
  static const Color primaryTint20 = Color(0x33FC6833);

  /// Fully transparent end-stop for the orange -> transparent text
  /// gradient used on highlighted inline copy (e.g. "Legalive
  /// Assistant").
  static const Color primaryGradientEnd = Color(0x00FC6833);

  /// Checked-checkbox outer ring color.
  static const Color primaryCheckRing = Color(0xFFFFD6C8);

  /// Checked-checkbox inset-shadow highlight (lighter).
  static const Color primaryCheckShadowLight = Color(0xFFFFBAA1);

  /// Checked-checkbox inset-shadow highlight (used on the
  /// currently-selected / emphasized variant).
  static const Color primaryCheckShadowStrong = Color(0xFFFFAA8B);

  // ---------------------------------------------------------------------
  // Base
  // ---------------------------------------------------------------------

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  /// Modal / bottom-sheet scrim overlay (52% black).
  static const Color scrim = Color(0x85000000);

  // ---------------------------------------------------------------------
  // Text
  // ---------------------------------------------------------------------

  /// Primary text — headings, titles, card labels, list-row values.
  static const Color textPrimary = Color(0xFF2F2F2F);

  /// Secondary text — subtitles, muted labels, placeholder copy.
  static const Color textSecondary = Color(0xFF8B8B8B);

  /// Alternate secondary tone seen on a few labels (e.g.
  /// "Recommended option" prefix text).
  static const Color textSecondaryAlt = Color(0xFF8D8D8D);

  /// Body copy on light surfaces (hero paragraphs, descriptions).
  static const Color textBody = Color(0xFF444444);

  /// Slightly darker body variant used for value text next to labels
  /// (e.g. "POA, Buying Property", phone-number static prefix).
  static const Color textBodyAlt = Color(0xFF383838);

  /// Tertiary / footnote text (support links, disclaimers).
  static const Color textTertiary = Color(0xFF606060);

  /// Muted description copy under checklist items and section
  /// headers (very frequently used across forms).
  static const Color textMuted = Color(0xFF6A6A6A);

  /// Muted text specifically for warning/notice banners.
  static const Color textMutedWarning = Color(0xFF656565);

  /// Form input floating-label text.
  static const Color textLabel = Color(0xFF4F4F4F);

  /// Secondary caption text (confirmation-screen subtext).
  static const Color textCaption = Color(0xFF5C5C5C);

  /// Status-bar clock / highest-emphasis neutral text.
  static const Color textNeutral1000 = Color(0xFF151413);

  /// Text rendered on top of [primary] surfaces (buttons, active pills).
  static const Color textOnPrimary = white;

  // ---------------------------------------------------------------------
  // Surfaces & backgrounds
  // ---------------------------------------------------------------------

  /// Default screen background.
  static const Color surface = white;

  /// Soft neutral card / input / section background — the most common
  /// non-white surface in the design.
  static const Color surfaceMuted = Color(0xFFF9F9F9);

  /// Icon-chip / avatar circular background.
  static const Color surfaceIcon = Color(0xFFF2F2F2);

  /// Slightly darker icon-chip background used in a couple of toggle
  /// controls (e.g. unselected "Online" segmented option).
  static const Color surfaceIconAlt = Color(0xFFEEEEEE);

  /// Gradient start for the "How it works" step cards
  /// (`from-[#faf8f7] to-[#f9f9f9]`).
  static const Color surfaceGradientStart = Color(0xFFFAF8F7);

  // ---------------------------------------------------------------------
  // Borders & dividers
  // ---------------------------------------------------------------------

  static const Color borderSubtle = Color(0xFFF5F5F5);
  static const Color borderDefault = Color(0xFFD5D5D5);
  static const Color borderLight = Color(0xFFE6E6E6);

  /// Slightly darker neutral border seen on service-description
  /// cards and status-stepper icon chips.
  static const Color borderMuted = Color(0xFFDADADA);

  /// Faint border used on the "How it works" step cards.
  static const Color borderFaint = Color(0xFFEFEFEF);

  /// Divider / drag-handle ("iOS home button") gray.
  /// Figma style name: "Neutral/Gray 30".
  static const Color neutralGray30 = Color(0xFFC6C6C6);

  /// 10%-opacity dark border used on text-input outlines
  /// (`#1B1D21` / Figma style "Main Color/Dark" at 10%).
  static const Color inputBorder = Color(0x1A1B1D21);

  // ---------------------------------------------------------------------
  // Inner highlight
  // ---------------------------------------------------------------------

  /// Faint inset highlight used on pill buttons and progress-bar
  /// segments (`shadow-[inset_0px_0px_4px_0px_#f5f5f5]`).
  static const Color innerHighlight = Color(0xFFF5F5F5);

  /// Unchecked-checkbox outer ring color.
  static const Color checkboxRingIdle = Color(0xFFEDEDED);
}
