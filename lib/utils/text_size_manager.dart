//filename: text_size_manager.dart

import 'package:flutter/material.dart';

class TextSizeManager {
  static double getDynamicTextSize(
    BuildContext context, {
    required double baseSize,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor;

    if (screenWidth < 480) {
      scaleFactor = 0.7; // Very small screens
    } else if (screenWidth < 600) {
      scaleFactor = 0.8; // Small screens
    } else if (screenWidth < 900) {
      scaleFactor = 0.9; // Medium screens
    } else if (screenWidth < 1200) {
      scaleFactor = 1.0; // Tablets
    } else {
      scaleFactor = 1.1; // Large screens
    }

    return (baseSize * scaleFactor).clamp(baseSize * 0.6, baseSize * 1.2);
  }
}
