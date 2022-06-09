/// Clase para calcular el alto y ancho de los widgets
class CalculatedSize {
  /// Método para calcular el alto de los widgets
  static double calculatedHeight(double value, double maxHeight) {
    return maxHeight * (((value * 100) / maxHeight) / 100);
  }

  /// Método para calcular el ancho de los widgets
  static double calculatedWidth(double value, double maxWidth) {
    return maxWidth * (((value * 100) / maxWidth) / 100);
  }
}
