import 'package:flutter/material.dart';
import 'package:islamic_app/core/utils/app_font_weights.dart';

abstract class LightAppTextStyles {
  /// A bold, 20px Amiri font style with a specific color.
  static TextStyle get amiriBold20 => const TextStyle(
        fontFamily: 'Amiri',
        color: Color(0xFF863ED5),
        fontSize: 20,
        fontWeight: AppFontWeight.bold,
      );

  /// A bold, 18px Amiri font style with a specific color.
  static TextStyle get amiriBold18 => amiriBold20.copyWith(
        fontSize: 18,
        color: const Color(0xFF240F4F),
      );

  /// A semi-bold, 18px Poppins font style in white.
  static TextStyle get whiteSemiBold18 => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: AppFontWeight.semiBold,
        color: Colors.white,
      );

  /// A semi-bold, 24px Poppins font style with a specific color.
  static TextStyle get semiBold24 => whiteSemiBold18.copyWith(
        fontSize: 24,
        color: const Color(0xFF240F4F),
      );

  /// A semi-bold, 16px Poppins font style with a specific color.
  static TextStyle get semiBold16 => semiBold24.copyWith(
        fontSize: 16,
        color: const Color(0xFF672CBC),
      );

  /// A bold, 20px Poppins font style with a specific color.
  static TextStyle get bold20 => amiriBold20.copyWith(
        fontFamily: 'Poppins',
        color: const Color(0xFF672CBC),
      );

  /// A bold, 28px Poppins font style with a specific color.
  static TextStyle get bold28 => bold20.copyWith(
        fontSize: 28,
      );

  /// A medium, 16px Poppins font style with a specific color.
  static TextStyle get medium16 => const TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xFF240F4F),
        fontSize: 16,
        fontWeight: AppFontWeight.medium,
      );

  /// A medium, 26px Poppins font style in white.
  static TextStyle get medium26 => medium16.copyWith(
        fontSize: 26,
        color: Colors.white,
      );

  /// A regular, 16px Poppins font style with a specific color.
  static TextStyle get regular16 => medium16.copyWith(
        fontWeight: AppFontWeight.regular,
      );

  /// A regular, 14px Poppins font style in white.
  static TextStyle get regular14 => regular16.copyWith(
        fontSize: 14,
        color: Colors.white,
      );

  /// A regular, 18px Poppins font style with a specific color.
  static TextStyle get regular18 => regular16.copyWith(
        fontSize: 18,
        color: const Color(0xFF8789A3),
      );

  /// A medium, 18px Poppins font style with a specific color.
  static TextStyle get medium18 => regular18.copyWith(
        fontWeight: AppFontWeight.medium,
      );

  /// A medium, 14px Poppins font style with a specific color.
  static TextStyle get medium14 => medium16.copyWith(
        color: const Color(0xFF240F4F),
        fontSize: 14,
      );

  /// A medium, 14px Poppins font style in white.
  static TextStyle get whiteMedium14 => medium14.copyWith(
        color: Colors.white,
      );

  /// A medium, 12px Poppins font style with a specific color.
  static TextStyle get medium12 => medium16.copyWith(
        color: const Color(0xFF8789A3),
        fontSize: 12,
      );
}
