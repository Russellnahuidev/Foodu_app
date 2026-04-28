// lib/core/utils/app_date_utils.dart

import 'package:intl/intl.dart';

class AppDateUtils {
  AppDateUtils._();

  static final DateFormat _longDate = DateFormat('d MMMM, yyyy', 'es');

  static final DateFormat _shortTime = DateFormat('HH:mm', 'es');

  static final DateFormat _birthDate = DateFormat('dd/MM/yyyy');

  static String formatFechaHora(DateTime dateTime) {
    final localDate = dateTime.toLocal();

    return '${_longDate.format(localDate)} '
        'a las ${_shortTime.format(localDate)}';
  }

  static String formatFechaLarga(DateTime dateTime) {
    return _longDate.format(dateTime.toLocal());
  }

  static String formatHora(DateTime dateTime) {
    return _shortTime.format(dateTime.toLocal());
  }

  static String formatBirthDate(DateTime dateTime) {
    return _birthDate.format(dateTime);
  }

  static String formatForApi(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatRangeForApi(DateTime start, DateTime end) {
    return '${formatForApi(start)}-'
        '${formatForApi(end)}';
  }
}
