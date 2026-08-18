import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_tokens.dart';
import '../../../../core/l10n/generated/app_l10n.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../../../../core/widgets/app_message_view.dart';
import '../../domain/entities/call.dart';
import '../bloc/call_bloc.dart';
import '../widgets/call_action_button.dart';
import '../widgets/call_identity.dart';
import '../widgets/call_scaffold.dart';

/// Full-screen ringing UI for an inbound call.
class IncomingCallPage extends StatelessWidget {
  const IncomingCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppL10n l10n = AppL10n.of(context);

    return CallScaffold(
      child: BlocConsumer<CallBloc, CallState>(
        listenWhen: (CallState previous, CallState current) =>
            previous.activeCall?.status != current.activeCall?.status,
        listener: _onStatusChanged,
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

          return _IncomingCallBody(call: call);
        },
      ),
    );
  }

  /// Answering swaps this screen for the in-call screen; anything terminal
  /// closes it. Navigation lives in the listener so the builder stays pure.
  static void _onStatusChanged(BuildContext context, CallState state) {
    final Call? call = state.activeCall;
    if (call == null) {
      return;
    }
    if (call.status == CallStatus.connecting ||
        call.status == CallStatus.active) {
      context.pushReplacement(AppRoutes.ongoingCallPathFor(call.id));
      return;
    }
    if (call.isFinished && context.canPop()) {
      context.pop();
    }
  }
}

class _IncomingCallBody extends StatelessWidget {
  const _IncomingCallBody({required this.call});

  final Call call;

  @override
  Widget build(BuildContext context) {
    final AppL10n l10n = AppL10n.of(context);

    // Scrollable so the buttons stay reachable on a short screen at a large
    // text scale rather than being pushed off the bottom.
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.xxl,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight:
              MediaQuery.sizeOf(context).height -
              MediaQuery.paddingOf(context).vertical -
              AppSpacing.xxl * 2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(height: AppSpacing.xxxl),
            CallIdentity(
              name: call.peerName,
              avatarUrl: call.peerAvatarUrl,
              status: Text(
                call.isVideo ? l10n.callIncomingVideo : l10n.callIncomingAudio,
              ),
            ),
            const SizedBox(height: AppSpacing.xxxl),
            _AnswerControls(
              onAccept: () =>
                  context.read<CallBloc>().add(const CallAnswered()),
              onDecline: () =>
                  context.read<CallBloc>().add(const CallRejected()),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnswerControls extends StatelessWidget {
  const _AnswerControls({required this.onAccept, required this.onDecline});

  final VoidCallback onAccept;
  final VoidCallback onDecline;

  @override
  Widget build(BuildContext context) {
    final AppL10n l10n = AppL10n.of(context);

    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: AppSpacing.xxl,
      runSpacing: AppSpacing.xl,
      children: <Widget>[
        CallActionButton(
          icon: Icons.call_end_rounded,
          label: l10n.callActionDecline,
          diameter: AppSizes.callPrimaryButton,
          background: CallPalette.decline,
          foreground: CallPalette.onSurface,
          onPressed: onDecline,
        ),
        CallActionButton(
          icon: Icons.call_rounded,
          label: l10n.callActionAccept,
          diameter: AppSizes.callPrimaryButton,
          background: CallPalette.accept,
          foreground: CallPalette.onSurface,
          onPressed: onAccept,
        ),
      ],
    );
  }
}
