import 'size_config.dart';

class SpacingManager {
  /// Adaptive spacing tokens (2-4-8-16-24-32-40-48...)
  static double get xxs => SizeConfig.scale(2); // Extra extra small
  static double get xs => SizeConfig.scale(4); // Extra small
  static double get sm => SizeConfig.scale(8); // Small
  static double get md => SizeConfig.scale(16); // Medium
  static double get lg => SizeConfig.scale(24); // Large
  static double get xl => SizeConfig.scale(32); // Extra large
  static double get xxl => SizeConfig.scale(40); // Extra extra large
  static double get xxxl => SizeConfig.scale(48); // Huge
}
