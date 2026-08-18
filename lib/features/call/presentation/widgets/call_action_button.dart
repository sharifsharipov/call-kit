import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_tokens.dart';

/// Circular call control with a caption underneath.
///
/// Used for both the media toggles and the accept/decline buttons, so the
/// hit area, focus ring and disabled treatment are defined once.
class CallActionButton extends StatelessWidget {
  const CallActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isActive = false,
    this.background,
    this.foreground,
    this.diameter = AppSizes.callActionButton,
    this.showLabel = true,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  /// Toggled state — inverts the surface so "muted" is obvious at a glance
  /// and is also announced to screen readers.
  final bool isActive;
  final Color? background;
  final Color? foreground;
  final double diameter;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color surface =
        background ??
        (isActive ? CallPalette.surfaceActive : CallPalette.surface);
    final Color content =
        foreground ??
        (isActive ? CallPalette.onSurfaceActive : CallPalette.onSurface);

    return Semantics(
      button: true,
      toggled: background == null ? isActive : null,
      label: label,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox.square(
            dimension: diameter,
            child: Material(
              color: surface,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onPressed,
                child: Icon(icon, color: content, size: diameter * 0.4),
              ),
            ),
          ),
          if (showLabel) ...<Widget>[
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              width: diameter + AppSpacing.lg,
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: CallPalette.onSurfaceMuted,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
