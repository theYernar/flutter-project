import 'package:intl/intl.dart';

extension IntegerExtension on num? {

  ///
  /// Example: 1000 -> 1 000
  ///
  String thousandFormat() {
    if (this == null) {
      return '';
    }
    final priceFormatter = NumberFormat();

    return priceFormatter.format(this).replaceAll(',', ' ');
  }
}

