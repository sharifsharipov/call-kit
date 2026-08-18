import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_tokens.dart';
import '../../../../core/widgets/app_avatar.dart';

/// Avatar, peer name and one line of call status.
class CallIdentity extends StatelessWidget {
  const CallIdentity({
    required this.name,
    required this.status,
    this.avatarUrl,
    this.showAvatar = true,
    super.key,
  });

  final String name;

  /// A widget rather than a string: the ongoing screen puts a ticking timer
  /// here, and only that subtree should rebuild every second.
  final Widget status;
  final String? avatarUrl;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (showAvatar) ...<Widget>[
          AppAvatar(name: name, imageUrl: avatarUrl, size: AppSizes.avatarXl),
          const SizedBox(height: AppSpacing.xl),
        ],
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: text.headlineMedium?.copyWith(color: CallPalette.onSurface),
        ),
        const SizedBox(height: AppSpacing.sm),
        DefaultTextStyle.merge(
          style: text.bodyLarge?.copyWith(color: CallPalette.onSurfaceMuted),
          textAlign: TextAlign.center,
          child: status,
        ),
      ],
    );
  }
}
