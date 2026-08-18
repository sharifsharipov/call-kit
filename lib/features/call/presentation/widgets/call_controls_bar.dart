import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_tokens.dart';
import '../../../../core/l10n/generated/app_l10n.dart';
import '../../domain/entities/call.dart';
import '../bloc/call_bloc.dart' show CallMediaControl;
import 'call_action_button.dart';

/// Media toggles plus the hang-up button.
///
/// Laid out with [Wrap] so the row reflows instead of overflowing on a 360dp
/// screen at a large system text scale.
class CallControlsBar extends StatelessWidget {
  const CallControlsBar({
    required this.call,
    required this.onToggle,
    required this.onHangUp,
    super.key,
  });

  final Call call;
  final ValueChanged<CallMediaControl> onToggle;
  final VoidCallback onHangUp;

  @override
  Widget build(BuildContext context) {
    final AppL10n l10n = AppL10n.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.center,
          spacing: AppSpacing.xl,
          runSpacing: AppSpacing.lg,
          children: <Widget>[
            CallActionButton(
              icon: call.isMicrophoneEnabled ? Icons.mic : Icons.mic_off,
              label: call.isMicrophoneEnabled
                  ? l10n.callActionMute
                  : l10n.callActionUnmute,
              isActive: !call.isMicrophoneEnabled,
              onPressed: () => onToggle(CallMediaControl.microphone),
            ),
            CallActionButton(
              icon: call.isSpeakerEnabled ? Icons.volume_up : Icons.volume_down,
              label: l10n.callActionSpeaker,
              isActive: call.isSpeakerEnabled,
              onPressed: () => onToggle(CallMediaControl.speaker),
            ),
            if (call.isVideo) ...<Widget>[
              CallActionButton(
                icon: call.isCameraEnabled
                    ? Icons.videocam
                    : Icons.videocam_off,
                label: l10n.callActionCamera,
                isActive: !call.isCameraEnabled,
                onPressed: () => onToggle(CallMediaControl.camera),
              ),
              CallActionButton(
                icon: Icons.cameraswitch_outlined,
                label: l10n.callActionSwitchCamera,
                onPressed: call.isCameraEnabled
                    ? () => onToggle(CallMediaControl.cameraFacing)
                    : null,
              ),
            ],
          ],
        ),
        const SizedBox(height: AppSpacing.xl),
        CallActionButton(
          icon: Icons.call_end_rounded,
          label: l10n.callActionEnd,
          diameter: AppSizes.callPrimaryButton,
          background: CallPalette.decline,
          foreground: CallPalette.onSurface,
          onPressed: onHangUp,
        ),
      ],
    );
  }
}
