import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/entities/message.dart';

/// A single chat bubble.
///
/// [isMine] is passed in rather than derived here: deciding who "me" is is a
/// page-level concern, and keeping it out makes this widget trivial to test.
class MessageBubble extends StatelessWidget {
  const MessageBubble({required this.message, required this.isMine, super.key});

  static const double _maxWidthFactor = 0.78;

  final Message message;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    final Color background = isMine ? scheme.primary : scheme.surface;
    final Color foreground = isMine ? scheme.onPrimary : scheme.onSurface;
    final Color metaColor = isMine
        ? scheme.onPrimary.withValues(alpha: 0.75)
        : scheme.onSurfaceVariant;

    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        // Bubbles are capped relative to the viewport so a long message wraps
        // instead of stretching edge to edge on a tablet.
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * _maxWidthFactor,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(AppRadius.lg),
              topRight: const Radius.circular(AppRadius.lg),
              bottomLeft: Radius.circular(isMine ? AppRadius.lg : AppRadius.sm),
              bottomRight: Radius.circular(
                isMine ? AppRadius.sm : AppRadius.lg,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                message.text,
                style: theme.textTheme.bodyLarge?.copyWith(color: foreground),
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    message.sentAt.asMessageTime,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: metaColor,
                    ),
                  ),
                  if (isMine) ...<Widget>[
                    const SizedBox(width: AppSpacing.xs),
                    _StatusTick(status: message.status, color: metaColor),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusTick extends StatelessWidget {
  const _StatusTick({required this.status, required this.color});

  final MessageStatus status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final (IconData icon, String semanticsLabel) = switch (status) {
      MessageStatus.sending => (Icons.schedule, 'Sending'),
      MessageStatus.sent => (Icons.check, 'Sent'),
      MessageStatus.delivered => (Icons.done_all, 'Delivered'),
      MessageStatus.read => (Icons.done_all, 'Read'),
      MessageStatus.failed => (Icons.error_outline, 'Failed to send'),
    };

    return Icon(
      icon,
      size: 14,
      // Read is the one status that earns a colour of its own; the rest stay
      // quiet so the tick never competes with the message text.
      color: status == MessageStatus.read ? AppColors.readReceipt : color,
      semanticLabel: semanticsLabel,
    );
  }
}
