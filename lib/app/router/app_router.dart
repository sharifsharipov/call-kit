import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/session/session_user.dart';
import '../../features/call/presentation/bloc/call_bloc.dart';
import '../../features/call/presentation/pages/incoming_call_page.dart';
import '../../features/call/presentation/pages/ongoing_call_page.dart';
import '../../features/chat/domain/entities/conversation.dart';
import '../../features/chat/presentation/bloc/chat/chat_bloc.dart';
import '../../features/chat/presentation/bloc/conversations/conversations_bloc.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/chat/presentation/pages/conversations_page.dart';
import '../../features/call/presentation/bloc/call_launcher_cubit.dart';
import '../di/injector.dart';
import 'app_routes.dart';

/// Composition root for navigation.
///
/// Each route resolves its BLoCs here and hands finished objects to the page,
/// which is what keeps the pages free of any locator lookup and testable with
/// a plain `BlocProvider` in a widget test.
abstract final class AppRouter {
  static GoRouter create({required SessionUser user}) {
    return GoRouter(
      initialLocation: AppRoutes.conversations,
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.conversations,
          name: AppRoutes.conversationsName,
          builder: (BuildContext context, GoRouterState state) => BlocProvider(
            create: (BuildContext _) =>
                sl<ConversationsBloc>()
                  ..add(ConversationsSubscriptionRequested(userId: user.id)),
            child: ConversationsPage(userId: user.id),
          ),
        ),
        GoRoute(
          path: AppRoutes.chat,
          name: AppRoutes.chatName,
          // The thread is opened with its conversation attached. A cold deep
          // link has no payload to render a header from, so it lands on the
          // inbox instead of a half-populated screen.
          redirect: (BuildContext context, GoRouterState state) =>
              state.extra is Conversation ? null : AppRoutes.conversations,
          builder: (BuildContext context, GoRouterState state) {
            final Conversation conversation = state.extra! as Conversation;
            return MultiBlocProvider(
              providers: <BlocProvider<dynamic>>[
                BlocProvider<ChatBloc>(
                  create: (BuildContext _) =>
                      sl<ChatBloc>(param1: conversation.id)..add(
                        ChatSubscriptionRequested(
                          conversationId: conversation.id,
                        ),
                      ),
                ),
                BlocProvider<CallLauncherCubit>(
                  create: (BuildContext _) => sl<CallLauncherCubit>(),
                ),
              ],
              child: ChatPage(
                conversation: conversation,
                currentUserId: user.id,
              ),
            );
          },
        ),
        GoRoute(
          path: AppRoutes.incomingCall,
          name: AppRoutes.incomingCallName,
          builder: (BuildContext context, GoRouterState state) => _callScope(
            callId: state.pathParameters[AppRoutes.callIdParam]!,
            child: const IncomingCallPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.ongoingCall,
          name: AppRoutes.ongoingCallName,
          builder: (BuildContext context, GoRouterState state) => _callScope(
            callId: state.pathParameters[AppRoutes.callIdParam]!,
            child: const OngoingCallPage(),
          ),
        ),
      ],
      errorBuilder: (BuildContext context, GoRouterState state) =>
          _RouteNotFoundPage(location: state.uri.toString()),
    );
  }

  static Widget _callScope({required String callId, required Widget child}) =>
      BlocProvider<CallBloc>(
        create: (BuildContext _) =>
            sl<CallBloc>(param1: callId)
              ..add(CallSubscriptionRequested(callId: callId)),
        child: child,
      );
}

class _RouteNotFoundPage extends StatelessWidget {
  const _RouteNotFoundPage({required this.location});

  final String location;

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text('No route for $location')));
}
