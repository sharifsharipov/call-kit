import 'package:intl/intl.dart';

enum CalendarDay { today, yesterday, earlier }

extension ChatDateFormatting on DateTime {
  CalendarDay calendarDay({DateTime? now}) {
    final DateTime reference = now ?? DateTime.now();
    if (_isSameDay(reference)) {
      return CalendarDay.today;
    }
    if (_isSameDay(reference.subtract(const Duration(days: 1)))) {
      return CalendarDay.yesterday;
    }
    return CalendarDay.earlier;
  }

  String asConversationTimestamp({DateTime? now}) {
    final DateTime reference = now ?? DateTime.now();
    if (_isSameDay(reference)) {
      return DateFormat.Hm().format(this);
    }
    if (reference.difference(this).inDays < 7) {
      return DateFormat.E().format(this);
    }
    return DateFormat.yMd().format(this);
  }

  String get asMessageTime => DateFormat.Hm().format(this);

  String get asFullDate => DateFormat.yMMMMd().format(this);

  bool _isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
}
