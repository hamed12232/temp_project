// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/add_icon.png
  AssetGenImage get addIcon =>
      const AssetGenImage('assets/images/add_icon.png');

  /// File path: assets/images/new_icon.png
  AssetGenImage get newIcon =>
      const AssetGenImage('assets/images/new_icon.png');

  /// Directory path: assets/images/request_status
  $AssetsImagesRequestStatusGen get requestStatus =>
      const $AssetsImagesRequestStatusGen();

  /// List of all assets
  List<AssetGenImage> get values => [addIcon, newIcon];
}

class $AssetsImagesRequestStatusGen {
  const $AssetsImagesRequestStatusGen();

  /// File path: assets/images/request_status/arrange_square.svg
  SvgGenImage get arrangeSquare =>
      const SvgGenImage('assets/images/request_status/arrange_square.svg');

  /// File path: assets/images/request_status/arrow_back_chevron.svg
  SvgGenImage get arrowBackChevron =>
      const SvgGenImage('assets/images/request_status/arrow_back_chevron.svg');

  /// File path: assets/images/request_status/arrow_back_square.svg
  SvgGenImage get arrowBackSquare =>
      const SvgGenImage('assets/images/request_status/arrow_back_square.svg');

  /// File path: assets/images/request_status/arrow_forward.svg
  SvgGenImage get arrowForward =>
      const SvgGenImage('assets/images/request_status/arrow_forward.svg');

  /// File path: assets/images/request_status/badge_grey.svg
  SvgGenImage get badgeGrey =>
      const SvgGenImage('assets/images/request_status/badge_grey.svg');

  /// File path: assets/images/request_status/badge_orange.svg
  SvgGenImage get badgeOrange =>
      const SvgGenImage('assets/images/request_status/badge_orange.svg');

  /// File path: assets/images/request_status/chat_icon.svg
  SvgGenImage get chatIcon =>
      const SvgGenImage('assets/images/request_status/chat_icon.svg');

  /// File path: assets/images/request_status/divider_line.svg
  SvgGenImage get dividerLine =>
      const SvgGenImage('assets/images/request_status/divider_line.svg');

  /// File path: assets/images/request_status/step_connector.svg
  SvgGenImage get stepConnector =>
      const SvgGenImage('assets/images/request_status/step_connector.svg');

  /// File path: assets/images/request_status/verify_completed.svg
  SvgGenImage get verifyCompleted =>
      const SvgGenImage('assets/images/request_status/verify_completed.svg');

  /// File path: assets/images/request_status/verify_filter_completed.svg
  SvgGenImage get verifyFilterCompleted => const SvgGenImage(
    'assets/images/request_status/verify_filter_completed.svg',
  );

  /// File path: assets/images/request_status/verify_filter_pending.svg
  SvgGenImage get verifyFilterPending => const SvgGenImage(
    'assets/images/request_status/verify_filter_pending.svg',
  );

  /// File path: assets/images/request_status/verify_pending.svg
  SvgGenImage get verifyPending =>
      const SvgGenImage('assets/images/request_status/verify_pending.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    arrangeSquare,
    arrowBackChevron,
    arrowBackSquare,
    arrowForward,
    badgeGrey,
    badgeOrange,
    chatIcon,
    dividerLine,
    stepConnector,
    verifyCompleted,
    verifyFilterCompleted,
    verifyFilterPending,
    verifyPending,
  ];
}

abstract final class Assets {
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
