import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const lightTextColor = Colors.black;
  static const lightBorderColor = Colors.black54;
  static final lightBackgroundColor = Colors.black.withValues(alpha: 0.05);

  // Dark Theme Colors
  static const darkTextColor = Colors.white;
  static const darkBorderColor = Colors.white54;
  static final darkBackgroundColor = Colors.white.withValues(alpha: 0.05);

  /// Getters based on current brightness
  static Color textColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextColor
        : lightTextColor;
  }

  static Color borderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBorderColor
        : lightBorderColor;
  }

  static Color backgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackgroundColor
        : lightBackgroundColor;
  }
}
