import 'package:intl/intl.dart';

class AppFormatters {
  AppFormatters._();

  // Currency formatter
  static String currency(double amount, {String symbol = 'S/'}) {
    final formatter = NumberFormat.currency(
      symbol: '$symbol ',
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  static String currencyCompact(double amount, {String symbol = 'S/'}) {
    return '$symbol ${amount.toStringAsFixed(2)}';
  }

  // Date formatter
  static String date(DateTime date) {
    return DateFormat('dd MMM yyyy', 'es_PE').format(date);
  }

  static String dateTime(DateTime date) {
    return DateFormat('dd MMM yyyy, hh:mm a', 'es_PE').format(date);
  }

  // Time formatter
  static String time(DateTime date) {
    return DateFormat('hh:mm a', 'es_PE').format(date);
  }

  static String relativeDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 1) return 'Ahora mismo';
    if (diff.inMinutes < 60) return 'Hace ${diff.inMinutes} min';
    if (diff.inHours < 24) return 'Hace ${diff.inHours} h';
    if (diff.inDays == 1) return 'Ayer';
    if (diff.inDays < 7) return 'Hace ${diff.inDays} días';
    return dateTime(date);
  }

  // Distance formatter
  static String distance(double meters) {
    if (meters < 1000) {
      return '${meters.toStringAsFixed(0)} m';
    } else {
      return '${(meters / 1000).toStringAsFixed(1)} km';
    }
  }

  //Rating formatter
  static String rating(double rating) {
    return rating.toStringAsFixed(1);
  }

  // Phone number formatter
  static String phone(String phoneNumber) {
    if (phoneNumber.length == 9) {
      return '+51 ${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    }
    return phoneNumber;
  }

  // Delivery time formatter
  static String deliveryTime(int minutes) {
    if (minutes < 60) return '$minutes min';
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return m == 0 ? '${h}h' : '${h}h ${m}min';
  }

  // Order number formatter
  static String orderNumber(String id) {
    final short = id.length > 8
        ? id.substring(0, 8).toUpperCase()
        : id.toUpperCase();
    return '#$short';
  }

  // Initials formatter
  static String initials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length == 1) return '';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0].toUpperCase()}${parts[1][0].toUpperCase()}';
  }
}
