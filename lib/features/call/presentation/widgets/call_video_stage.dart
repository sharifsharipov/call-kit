import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_tokens.dart';
import '../../../../core/l10n/generated/app_l10n.dart';
import '../../../../core/widgets/app_avatar.dart';

/// Remote video surface with a self-view inset.
///
/// The two surfaces are placeholders: this build has no media engine wired up,
/// so the layout is final but the pixels are not live frames. Dropping a
/// renderer in later replaces the two marked children and nothing else.
class CallVideoStage extends StatelessWidget {
  const CallVideoStage({
    required this.peerName,
    required this.isRemoteCameraEnabled,
    required this.isLocalCameraEnabled,
    this.peerAvatarUrl,
    super.key,
  });

  static const double _selfViewWidth = 96;
  static const double _selfViewAspect = 3 / 4;

  final String peerName;
  final String? peerAvatarUrl;
  final bool isRemoteCameraEnabled;
  final bool isLocalCameraEnabled;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // Remote renderer goes here.
        _Surface(
          child: isRemoteCameraEnabled
              ? const _VideoPlaceholder(icon: Icons.videocam_outlined)
              : _CameraOffAvatar(name: peerName, imageUrl: peerAvatarUrl),
        ),
        Positioned(
          right: AppSpacing.lg,
          top: AppSpacing.lg,
          child: SizedBox(
            width: _selfViewWidth,
            height: _selfViewWidth / _selfViewAspect,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.md),
              // Local renderer goes here.
              child: _Surface(
                child: isLocalCameraEnabled
                    ? const _VideoPlaceholder(icon: Icons.person_outline)
                    : const _CameraOffLabel(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Surface extends StatelessWidget {
  const _Surface({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: CallPalette.backgroundTop,
    child: Center(child: child),
  );
}

class _VideoPlaceholder extends StatelessWidget {
  const _VideoPlaceholder({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) =>
      Icon(icon, size: 40, color: CallPalette.onSurfaceMuted);
}

class _CameraOffAvatar extends StatelessWidget {
  const _CameraOffAvatar({required this.name, required this.imageUrl});

  final String name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) =>
      AppAvatar(name: name, imageUrl: imageUrl, size: AppSizes.avatarXl);
}

class _CameraOffLabel extends StatelessWidget {
  const _CameraOffLabel();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(AppSpacing.sm),
    child: Text(
      AppL10n.of(context).callCameraOff,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelSmall
          ?.copyWith(color: CallPalette.onSurfaceMuted),
    ),
  );
}
