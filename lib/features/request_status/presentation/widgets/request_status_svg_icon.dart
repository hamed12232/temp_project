import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestStatusSvgIcon extends StatelessWidget {
  const RequestStatusSvgIcon({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.colorFilter,
  });

  final String asset;
  final double? width;
  final double? height;
  final BoxFit fit;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        asset,
        width: width,
        height: height,
        fit: fit,
        colorFilter: colorFilter,
      ),
    );
  }
}
