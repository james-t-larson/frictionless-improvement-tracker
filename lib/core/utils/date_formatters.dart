import 'package:intl/intl.dart';

class DateFormatters {
  static String formatTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return _format(date);
  }

  static String formatDateString(String dateString) {
    if (dateString.isEmpty) return 'Unknown Date';
    final date = DateTime.tryParse(dateString) ?? DateTime.now();
    return _format(date);
  }

  static String _format(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final checkDate = DateTime(date.year, date.month, date.day);

    if (checkDate == today) {
      return 'Today';
    } else if (checkDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM d, yyyy').format(date);
    }
  }
}
