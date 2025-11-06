import 'size_config.dart';

class IconSizeManager {
  /// Adaptive icon sizes
  static double get xs => SizeConfig.scale(16);
  static double get sm => SizeConfig.scale(20);
  static double get md => SizeConfig.scale(24);
  static double get lg => SizeConfig.scale(32);
  static double get xl => SizeConfig.scale(40);
  static double get xxl => SizeConfig.scale(48);

  /// Custom icon size
  static double custom(double baseSize) => SizeConfig.scale(baseSize);
}
