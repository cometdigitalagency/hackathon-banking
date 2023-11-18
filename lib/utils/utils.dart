import 'package:intl/intl.dart';

class Utils {
  static String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  static String formatDateTimeInTransactionList(DateTime dateTime) {
    final formatter = DateFormat('d MMM yyyy HH:mm');
    return formatter.format(dateTime);
  }

  static String getCurrency(num number) {
    return NumberFormat("#,###").format(number);
  }
}
