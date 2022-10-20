import 'package:intl/intl.dart';

class TextHelper {

  static const String peso = "₱ ";

  /// Format Number to Money
  static moneyFormat(number, [String? currency]) {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    currency = currency ?? TextHelper.peso;
    return  TextHelper.peso + oCcy.format(number);
  }
}