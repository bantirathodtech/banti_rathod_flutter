import 'package:flutter/material.dart';

/// A global configuration class for adaptive scaling.
/// Uses LayoutBuilder pattern to avoid calling init in build methods.
class SizeConfig {
  static double _scaleFactor = 1.0;
  static double _textScaleFactor = 1.0;

  /// Initializes the scaling factors based on screen width.
  /// This should be called from LayoutBuilder, not directly in build methods.
  static void init(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    _scaleFactor = screenWidth / 400; // 400px as base design width
    _textScaleFactor = MediaQuery.of(
      context,
    ).textScaler.scale(1.0).clamp(0.8, 1.2);
  }

  /// Scales any value (e.g., padding, margin, icon size).
  static double scale(double value) => value * _scaleFactor;

  /// Scales text size adaptively.
  static double textScale(double value) =>
      value * _scaleFactor * _textScaleFactor;

  /// Exposes current scale factor (for debugging or custom logic).
  static double get scaleFactor => _scaleFactor;
}

/// Widget that automatically initializes SizeConfig using LayoutBuilder
class SizeConfigBuilder extends StatelessWidget {
  final Widget Function(BuildContext context) builder;

  const SizeConfigBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.init(context);
        return builder(context);
      },
    );
  }
}
