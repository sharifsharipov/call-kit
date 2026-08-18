import 'package:flutter/material.dart';

import '../../../../app/theme/app_tokens.dart';

/// Centred date chip separating message groups.
class ChatDaySeparator extends StatelessWidget {
  const ChatDaySeparator({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
          child: Text(label, style: theme.textTheme.labelSmall),
        ),
      ),
    );
  }
}
