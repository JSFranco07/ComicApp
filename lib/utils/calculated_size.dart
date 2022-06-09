/// Class to calculated height and width
class CalculatedSize {
  /// Calculated height
  static double calculatedHeight(double value, double maxHeight) {
    return maxHeight * (((value * 100) / maxHeight) / 100);
  }

  /// Calculated width
  static double calculatedWidth(double value, double maxWidth) {
    return maxWidth * (((value * 100) / maxWidth) / 100);
  }
}
