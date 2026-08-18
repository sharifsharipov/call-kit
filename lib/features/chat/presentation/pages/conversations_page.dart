import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/config/env.dart';
import '../../../../core/l10n/generated/app_l10n.dart';
import '../../../../core/widgets/app_loading_view.dart';
import '../../../../core/widgets/app_message_view.dart';
import '../../domain/entities/conversation.dart';
import '../bloc/conversations/conversations_bloc.dart';
import '../widgets/conversation_tile.dart';

/// The inbox.
///
/// The page owns layout and navigation only; every branch of the state machine
/// is rendered by a dedicated widget below, so nothing here grows past a
/// screenful.
class ConversationsPage extends StatelessWidget {
  const ConversationsPage({required this.userId, super.key});

  final String userId;

  @override
  Widget build(BuildContext context) {
    final AppL10n l10n = AppL10n.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.conversationsTitle),
        actions: const <Widget>[_DemoIncomingCallAction()],
      ),
      body: SafeArea(
        child: BlocBuilder<ConversationsBloc, ConversationsState>(
          builder: (BuildContext context, ConversationsState state) {
            return switch (state.status) {
              ConversationsStatus.initial ||
              ConversationsStatus.loading => const AppLoadingView(),
              ConversationsStatus.failure => AppMessageView(
                icon: Icons.cloud_off_rounded,
                title: l10n.errorGenericTitle,
                message: state.failure?.message ?? '',
                actionLabel: l10n.actionRetry,
                onAction: () => context.read<ConversationsBloc>().add(
                  ConversationsSubscriptionRequested(userId: userId),
                ),
              ),
              ConversationsStatus.success when state.conversations.isEmpty =>
                AppMessageView(
                  icon: Icons.forum_outlined,
                  title: l10n.conversationsEmptyTitle,
                  message: l10n.conversationsEmptyMessage,
                ),
              ConversationsStatus.success => _ConversationList(
                conversations: state.conversations,
              ),
            };
          },
        ),
      ),
    );
  }
}

class _ConversationList extends StatelessWidget {
  const _ConversationList({required this.conversations});

  final List<Conversation> conversations;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: conversations.length,
      separatorBuilder: (BuildContext _, int _) => const Divider(indent: 84),
      itemBuilder: (BuildContext context, int index) {
        final Conversation conversation = conversations[index];
        return ConversationTile(
          conversation: conversation,
          onTap: () => context.push(
            AppRoutes.chatPathFor(conversation.id),
            extra: conversation,
          ),
        );
      },
    );
  }
}

/// Debug-only shortcut to the incoming-call screen.
///
/// In production that screen is reached from an FCM push, which cannot be
/// triggered from inside the app — hence a build-mode-guarded entry point
/// rather than a fake call in the domain layer.
class _DemoIncomingCallAction extends StatelessWidget {
  const _DemoIncomingCallAction();

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) {
      return const SizedBox.shrink();
    }
    return IconButton(
      onPressed: () =>
          context.push(AppRoutes.incomingCallPathFor(Env.demoIncomingCallId)),
      tooltip: 'Simulate incoming call',
      icon: const Icon(Icons.phone_callback_outlined),
    );
  }
}
