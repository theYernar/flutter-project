extension StringExtension on String {
  String limit(int length) =>
      length < this.length ? substring(0, length) : this;

  
  ///
  /// Example: 77777777777 -> +7 777 777 77 77
  ///
  String formatAsPhone() {
    if (length == 12 && startsWith('+')) {
      return '${substring(0, 2)} ${substring(2, 5)} ${substring(5, 8)} ${substring(8, 10)} ${substring(10, 12)}';
    }
    return this;
  }
}
