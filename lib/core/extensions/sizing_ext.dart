import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension CustomSize on num {
  double get asp => (this / (1.sp)).sp;
  double get aw => ((this / 374.0) * 100).w;
  double get ah => ((this / 812.0) * 100).h;

  /// SizedBox with height only..
  Widget get vsb => SizedBox(height: ah);

  /// SizedBox with width only..
  Widget get hsb => SizedBox(width: aw);
}
