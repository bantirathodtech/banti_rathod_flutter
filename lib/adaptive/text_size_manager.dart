import 'package:flutter/material.dart';

import 'size_config.dart';

/// Centralized text sizing utility.
class TextSizeManager {
  /// Define base text sizes
  static const double xs = 10;
  static const double sm = 12;
  static const double md = 14;
  static const double lg = 18;
  static const double xl = 24;
  static const double xxl = 32;

  /// Returns dynamically scaled text size.
  static double getDynamicTextSize(
    BuildContext context, {
    required double baseSize,
  }) {
    SizeConfig.init(context); // Ensure initialized
    return SizeConfig.textScale(baseSize);
  }

  /// Returns a responsive text style
  static TextStyle responsiveTextStyle(
    BuildContext context, {
    required double baseSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: getDynamicTextSize(context, baseSize: baseSize),
      color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
