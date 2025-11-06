//filename: layout_breakpoints.dart

class LayoutBreakpoints {
  static const double cardHorizontalSpacing = 16.0;
  static const double cardVerticalSpacing = 16.0;
  static const double maxCardWidth = 350.0;
  static const double minCardWidth = 150.0;

  static int getCardCountPerRow(double screenWidth) {
    if (screenWidth > 1400) {
      return 4; // Up to 4 cards
    } else if (screenWidth > 1000) {
      return 3;
    } else {
      return 2; // Minimum 2 cards for responsiveness
    }
  }
}
