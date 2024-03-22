import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension SvgExtension on String {
  Widget asSvg({
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      this,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
