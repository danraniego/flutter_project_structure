import 'package:intl/intl.dart';

class TextService {

  static const String peso = "₱ ";

  /// Format Number to Money
  static moneyFormat(number, [String? currency]) {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    currency = currency ?? TextService.peso;
    return  TextService.peso + oCcy.format(number);
  }
}