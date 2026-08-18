import 'package:flutter/material.dart';

import '../../../../app/theme/app_tokens.dart';
import '../../../../core/l10n/generated/app_l10n.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/entities/message.dart';
import 'chat_day_separator.dart';
import 'message_bubble.dart';

/// Scrollable message thread with day separators.
///
/// Built in reverse so new messages appear at the bottom without a scroll
/// controller and without measuring the list.
class ChatThreadView extends StatelessWidget {
  const ChatThreadView({
    required this.messages,
    required this.currentUserId,
    super.key,
  });

  final List<Message> messages;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    final AppL10n l10n = AppL10n.of(context);

    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        final int position = messages.length - 1 - index;
        final Message message = messages[position];
        final Message? previous = position == 0 ? null : messages[position - 1];
        final bool startsNewDay =
            previous == null || !_isSameDay(previous.sentAt, message.sentAt);

        final Widget bubble = MessageBubble(
          message: message,
          isMine: message.authorId == currentUserId,
        );

        if (!startsNewDay) {
          return bubble;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ChatDaySeparator(label: _dayLabel(l10n, message.sentAt)),
            bubble,
          ],
        );
      },
    );
  }

  static String _dayLabel(AppL10n l10n, DateTime date) =>
      switch (date.calendarDay()) {
        CalendarDay.today => l10n.dayToday,
        CalendarDay.yesterday => l10n.dayYesterday,
        CalendarDay.earlier => date.asFullDate,
      };

  static bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
