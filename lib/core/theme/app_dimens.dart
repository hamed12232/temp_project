import 'package:flutter/widgets.dart';

class AppRadius {
  AppRadius._();

  /// Smallest radius — small icon badges ("Add" / "Edit" glyph bg).
  static const double xxs = 6;

  /// Step-icon chip radius (e.g. "How it works" step icons).
  static const double xs = 10;

  /// Fee-breakdown / notice card inner radius.
  static const double sm = 14;

  /// Icon-chip / avatar background radius, and legacy card radius.
  static const double md = 16;

  /// Standard content-card radius — the most common card radius in
  /// the design (info sections, checklists, input groups).
  static const double lg = 20;

  /// Legacy content-card radius (a handful of older-style cards).
  static const double lgAlt = 22;

  /// Bottom-sheet top-corner radius.
  static const double sheet = 35;

  /// Header bottom-left corner radius.
  static const double headerBottomLeft = 25;

  /// Header bottom-right corner radius.
  static const double headerBottomRight = 15;

  /// Footer top-corner radius (rotated header background).
  static const double footer = 24;

  /// Fully-rounded pill (buttons, segmented control, tags, category
  /// chips, progress-bar segments). Larger than any control's
  /// height in this design, so it always renders as a stadium shape.
  static const double pill = 90;

  static const BorderRadius xxsAll = BorderRadius.all(Radius.circular(xxs));
  static const BorderRadius xsAll = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius smAll = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdAll = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgAll = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius lgAltAll =
      BorderRadius.all(Radius.circular(lgAlt));
  static const BorderRadius pillAll = BorderRadius.all(Radius.circular(pill));

  /// Header card: rounded bottom-left 25px, bottom-right 15px, square top.
  static const BorderRadius headerCard = BorderRadius.only(
    bottomLeft: Radius.circular(headerBottomLeft),
    bottomRight: Radius.circular(headerBottomRight),
  );

  /// Footer bar: rounded top corners only (24px).
  static const BorderRadius footerBar = BorderRadius.only(
    topLeft: Radius.circular(footer),
    topRight: Radius.circular(footer),
  );

  /// Bottom-sheet: rounded top corners only (35px).
  static const BorderRadius sheetTop = BorderRadius.only(
    topLeft: Radius.circular(sheet),
    topRight: Radius.circular(sheet),
  );
}

/// Spacing scale, from the 4/5/6/8/10/12/15/16/20/24px gaps observed
/// throughout the design.
class AppSpacing {
  AppSpacing._();

  static const double xxxs = 4;
  static const double xxs = 5;
  static const double xs = 6;
  static const double sm = 8;
  static const double smd = 10;
  static const double md = 12;
  static const double mdl = 15;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
}
