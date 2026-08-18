import 'package:flutter/material.dart';

import '../../../../app/theme/app_tokens.dart';

/// Pill-shaped unread counter.
///
/// Sized by its content rather than a fixed width so a three-digit count
/// stays legible instead of being clipped.
class UnreadBadge extends StatelessWidget {
  const UnreadBadge({required this.count, super.key});

  static const int _displayCap = 99;

  final int count;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String label = count > _displayCap ? '$_displayCap+' : '$count';

    return Container(
      constraints: const BoxConstraints(minWidth: 22),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
