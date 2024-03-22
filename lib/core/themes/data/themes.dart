import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/utils/app_text_styles.dart';

part '../colors/dark_colors.dart';
part '../colors/light_colors.dart';
part 'dark_theme.dart';
part 'light_theme.dart';

class Themes {
  static ThemeData get light => LightTheme.data;
  static ThemeData get dark => DarkTheme.data;
}
