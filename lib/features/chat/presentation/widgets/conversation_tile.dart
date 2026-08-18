import 'package:flutter/material.dart';

import '../../../../app/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_avatar.dart';
import '../../domain/entities/conversation.dart';
import 'unread_badge.dart';

/// One row of the inbox.
///
/// Presentational only: it renders a [Conversation] and reports taps. No BLoC
/// lookup inside, which is what makes it usable from a widget test and from a
/// future search screen without change.
class ConversationTile extends StatelessWidget {
  const ConversationTile({
    required this.conversation,
    required this.onTap,
    super.key,
  });

  final Conversation conversation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool hasUnread = conversation.hasUnread;

    return ListTile(
      onTap: onTap,
      leading: AppAvatar(
        name: conversation.peerName,
        imageUrl: conversation.peerAvatarUrl,
        isOnline: conversation.isPeerOnline,
      ),
      title: Text(
        conversation.peerName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.titleMedium,
      ),
      subtitle: Text(
        conversation.lastMessagePreview,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: hasUnread
              ? theme.colorScheme.onSurface
              : theme.colorScheme.onSurfaceVariant,
          fontWeight: hasUnread ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            conversation.lastMessageAt.asConversationTimestamp(),
            style: theme.textTheme.labelSmall,
          ),
          const SizedBox(height: AppSpacing.xs),
          // The badge keeps its slot even when empty, so rows do not shift
          // vertically as messages are read.
          SizedBox(
            height: 22,
            child: hasUnread
                ? UnreadBadge(count: conversation.unreadCount)
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
