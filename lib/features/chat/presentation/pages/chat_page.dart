import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_tokens.dart';
import '../../../../core/l10n/generated/app_l10n.dart';
import '../../../../core/widgets/app_avatar.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../../../../core/widgets/app_message_view.dart';
import '../../../call/domain/entities/call.dart';
import '../../../call/presentation/bloc/call_launcher_cubit.dart';
import '../../domain/entities/conversation.dart';
import '../bloc/chat/chat_bloc.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/chat_thread_view.dart';

/// A single conversation thread plus its composer.
class ChatPage extends StatelessWidget {
  const ChatPage({
    required this.conversation,
    required this.currentUserId,
    super.key,
  });

  final Conversation conversation;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    final AppL10n l10n = AppL10n.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: _ChatHeader(conversation: conversation),
        actions: <Widget>[
          _CallAction(
            icon: Icons.call_outlined,
            tooltip: l10n.chatStartAudioCall,
            media: CallMedia.audio,
            peerId: conversation.peerId,
          ),
          _CallAction(
            icon: Icons.videocam_outlined,
            tooltip: l10n.chatStartVideoCall,
            media: CallMedia.video,
            peerId: conversation.peerId,
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: MultiBlocListener(
        listeners: <BlocListener<dynamic, dynamic>>[
          BlocListener<ChatBloc, ChatState>(
            listenWhen: (ChatState previous, ChatState current) =>
                current.sendFailure != null &&
                previous.sendFailure != current.sendFailure,
            listener: (BuildContext context, ChatState state) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(l10n.chatSendFailed)));
              context.read<ChatBloc>().add(const ChatSendFailureDismissed());
            },
          ),
          BlocListener<CallLauncherCubit, CallLauncherState>(
            listener: _onCallLauncherChanged,
          ),
        ],
        child: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                // The composer's sending flag must not rebuild the thread.
                buildWhen: (ChatState previous, ChatState current) =>
                    previous.status != current.status ||
                    previous.messages != current.messages,
                builder: (BuildContext context, ChatState state) {
                  return switch (state.status) {
                    ChatStatus.initial ||
                    ChatStatus.loading => const AppLoadingView(),
                    ChatStatus.failure => AppMessageView(
                      icon: Icons.cloud_off_rounded,
                      title: l10n.errorGenericTitle,
                      message: state.failure?.message ?? '',
                      actionLabel: l10n.actionRetry,
                      onAction: () => context.read<ChatBloc>().add(
                        ChatSubscriptionRequested(
                          conversationId: conversation.id,
                        ),
                      ),
                    ),
                    ChatStatus.success when state.messages.isEmpty =>
                      AppMessageView(
                        icon: Icons.chat_bubble_outline_rounded,
                        title: l10n.chatEmptyTitle,
                        message: l10n.chatEmptyMessage,
                      ),
                    ChatStatus.success => ChatThreadView(
                      messages: state.messages,
                      currentUserId: currentUserId,
                    ),
                  };
                },
              ),
            ),
            // Only the send button depends on `isSending`, so it is selected
            // separately instead of rebuilding the whole column.
            BlocSelector<ChatBloc, ChatState, bool>(
              selector: (ChatState state) => state.isSending,
              builder: (BuildContext context, bool isSending) => ChatInputBar(
                hintText: l10n.chatInputHint,
                sendTooltip: l10n.actionSend,
                isSending: isSending,
                onSend: (String text) => context.read<ChatBloc>().add(
                  ChatMessageSubmitted(text: text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _onCallLauncherChanged(
    BuildContext context,
    CallLauncherState state,
  ) {
    final String? callId = state.callId;
    if (state.status != CallLauncherStatus.placed || callId == null) {
      return;
    }
    // Reset before navigating so returning to this page cannot re-trigger the
    // push from a replayed state.
    context.read<CallLauncherCubit>().reset();
    context.push(AppRoutes.ongoingCallPathFor(callId));
  }
}

class _ChatHeader extends StatelessWidget {
  const _ChatHeader({required this.conversation});

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppL10n l10n = AppL10n.of(context);

    return Row(
      children: <Widget>[
        AppAvatar(
          name: conversation.peerName,
          imageUrl: conversation.peerAvatarUrl,
          size: AppSizes.avatarSm,
          isOnline: conversation.isPeerOnline,
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                conversation.peerName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium,
              ),
              Text(
                conversation.isPeerOnline
                    ? l10n.chatPresenceOnline
                    : l10n.chatPresenceOffline,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CallAction extends StatelessWidget {
  const _CallAction({
    required this.icon,
    required this.tooltip,
    required this.media,
    required this.peerId,
  });

  final IconData icon;
  final String tooltip;
  final CallMedia media;
  final String peerId;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CallLauncherCubit, CallLauncherState, bool>(
      selector: (CallLauncherState state) =>
          state.status == CallLauncherStatus.placing,
      builder: (BuildContext context, bool isPlacing) => IconButton(
        onPressed: isPlacing
            ? null
            : () => context.read<CallLauncherCubit>().place(
                peerId: peerId,
                media: media,
              ),
        tooltip: tooltip,
        icon: Icon(icon),
      ),
    );
  }
}
