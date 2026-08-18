import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_tokens.dart';
import '../../../../core/l10n/generated/app_l10n.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../../../../core/widgets/app_message_view.dart';
import '../../domain/entities/call.dart';
import '../bloc/call_bloc.dart';
import '../widgets/call_controls_bar.dart';
import '../widgets/call_identity.dart';
import '../widgets/call_scaffold.dart';
import '../widgets/call_timer_text.dart';
import '../widgets/call_video_stage.dart';

/// The in-call screen, for both outgoing and answered calls.
class OngoingCallPage extends StatelessWidget {
  const OngoingCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppL10n l10n = AppL10n.of(context);

    return CallScaffold(
      child: BlocConsumer<CallBloc, CallState>(
        listenWhen: (CallState previous, CallState current) =>
            previous.activeCall?.status != current.activeCall?.status,
        listener: (BuildContext context, CallState state) {
          // The call is over — from either side — so the screen retires itself.
          if ((state.activeCall?.isFinished ?? false) && context.canPop()) {
            context.pop();
          }
        },
        builder: (BuildContext context, CallState state) {
          final Call? call = state.activeCall;

          if (state.status == CallStateStatus.failure) {
            return AppMessageView(
              icon: Icons.phone_disabled_outlined,
              title: l10n.callFailed,
              message: state.failure?.message ?? '',
              actionLabel: l10n.actionRetry,
              onAction: () => context.read<CallBloc>().add(
                CallSubscriptionRequested(callId: state.callId),
              ),
            );
          }
          if (call == null) {
            return const AppLoadingView();
          }

          return _OngoingCallBody(call: call);
        },
      ),
    );
  }
}

class _OngoingCallBody extends StatelessWidget {
  const _OngoingCallBody({required this.call});

  final Call call;

  @override
  Widget build(BuildContext context) {
    final bool showVideoStage = call.isVideo && call.isActive;

    return Stack(
      children: <Widget>[
        if (showVideoStage)
          Positioned.fill(
            child: CallVideoStage(
              peerName: call.peerName,
              peerAvatarUrl: call.peerAvatarUrl,
              // Without a media engine the remote camera mirrors the local
              // flag; a real renderer would report the peer's own state.
              isRemoteCameraEnabled: call.isCameraEnabled,
              isLocalCameraEnabled: call.isCameraEnabled,
            ),
          ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.xl,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _CallHeader(call: call, compact: showVideoStage),
                _Controls(call: call),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CallHeader extends StatelessWidget {
  const _CallHeader({required this.call, required this.compact});

  final Call call;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final AppL10n l10n = AppL10n.of(context);
    final TextStyle? statusStyle = Theme.of(context).textTheme.bodyLarge
        ?.copyWith(color: CallPalette.onSurfaceMuted);

    final DateTime? connectedAt = call.connectedAt;
    final Widget status = call.isActive && connectedAt != null
        ? CallTimerText(connectedAt: connectedAt, style: statusStyle)
        : Text(_statusLabel(l10n, call.status));

    return Padding(
      padding: EdgeInsets.only(top: compact ? 0 : AppSpacing.xxxl),
      child: CallIdentity(
        name: call.peerName,
        avatarUrl: call.peerAvatarUrl,
        status: status,
        // With live video the avatar would cover the frame, so only the name
        // and timer remain.
        showAvatar: !compact,
      ),
    );
  }

  static String _statusLabel(AppL10n l10n, CallStatus status) =>
      switch (status) {
        CallStatus.ringing => l10n.callOutgoingRinging,
        CallStatus.connecting => l10n.callConnecting,
        CallStatus.active => l10n.callConnecting,
        CallStatus.ended => l10n.callEnded,
        CallStatus.declined => l10n.callDeclined,
        CallStatus.failed => l10n.callFailed,
      };
}

class _Controls extends StatelessWidget {
  const _Controls({required this.call});

  final Call call;

  @override
  Widget build(BuildContext context) => CallControlsBar(
    call: call,
    onToggle: (CallMediaControl control) =>
        context.read<CallBloc>().add(CallMediaToggled(control)),
    onHangUp: () => context.read<CallBloc>().add(const CallHungUp()),
  );
}
