import 'package:bloc_test/bloc_test.dart';
import 'package:callkit_example/core/error/failures.dart';
import 'package:callkit_example/core/session/session_provider.dart';
import 'package:callkit_example/core/session/session_user.dart';
import 'package:callkit_example/features/chat/domain/entities/message.dart';
import 'package:callkit_example/features/chat/domain/usecases/send_message.dart';
import 'package:callkit_example/features/chat/domain/usecases/watch_messages.dart';
import 'package:callkit_example/features/chat/presentation/bloc/chat/chat_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockWatchMessages extends Mock implements WatchMessages {}

class _MockSendMessage extends Mock implements SendMessage {}

class _FakeSession implements SessionProvider {
  @override
  SessionUser get current => SessionUser.demo;
}

void main() {
  late _MockWatchMessages watchMessages;
  late _MockSendMessage sendMessage;

  final Message message = Message(
    id: 'm1',
    conversationId: 'c1',
    authorId: 'me',
    text: 'hello',
    sentAt: DateTime(2026, 8, 18, 10),
  );

  setUpAll(() {
    registerFallbackValue(const WatchMessagesParams(conversationId: 'c1'));
    registerFallbackValue(
      const SendMessageParams(conversationId: 'c1', authorId: 'me', text: 'x'),
    );
  });

  setUp(() {
    watchMessages = _MockWatchMessages();
    sendMessage = _MockSendMessage();
  });

  ChatBloc buildBloc() =>
      ChatBloc('c1', _FakeSession(), watchMessages, sendMessage);

  group('ChatSubscriptionRequested', () {
    blocTest<ChatBloc, ChatState>(
      'emits loading then success with the streamed messages',
      setUp: () {
        when(() => watchMessages(any())).thenAnswer(
          (_) => Stream<Either<Failure, List<Message>>>.value(
            Right<Failure, List<Message>>(<Message>[message]),
          ),
        );
      },
      build: buildBloc,
      act: (ChatBloc bloc) =>
          bloc.add(const ChatSubscriptionRequested(conversationId: 'c1')),
      expect: () => <Matcher>[
        isA<ChatState>().having(
          (ChatState s) => s.status,
          'status',
          ChatStatus.loading,
        ),
        isA<ChatState>()
            .having((ChatState s) => s.status, 'status', ChatStatus.success)
            .having((ChatState s) => s.messages, 'messages', <Message>[
              message,
            ]),
      ],
    );

    blocTest<ChatBloc, ChatState>(
      'emits failure when the stream yields a Left',
      setUp: () {
        when(() => watchMessages(any())).thenAnswer(
          (_) => Stream<Either<Failure, List<Message>>>.value(
            const Left<Failure, List<Message>>(NetworkFailure()),
          ),
        );
      },
      build: buildBloc,
      act: (ChatBloc bloc) =>
          bloc.add(const ChatSubscriptionRequested(conversationId: 'c1')),
      expect: () => <Matcher>[
        isA<ChatState>().having(
          (ChatState s) => s.status,
          'status',
          ChatStatus.loading,
        ),
        isA<ChatState>()
            .having((ChatState s) => s.status, 'status', ChatStatus.failure)
            .having(
              (ChatState s) => s.failure,
              'failure',
              const NetworkFailure(),
            ),
      ],
    );
  });

  group('ChatMessageSubmitted', () {
    blocTest<ChatBloc, ChatState>(
      'raises then clears the sending flag on success',
      setUp: () {
        when(() => sendMessage(any()))
            .thenAnswer((_) async => Right<Failure, Message>(message));
      },
      build: buildBloc,
      act: (ChatBloc bloc) =>
          bloc.add(const ChatMessageSubmitted(text: 'hello')),
      expect: () => <Matcher>[
        isA<ChatState>().having(
          (ChatState s) => s.isSending,
          'isSending',
          true,
        ),
        isA<ChatState>()
            .having((ChatState s) => s.isSending, 'isSending', false)
            .having((ChatState s) => s.sendFailure, 'sendFailure', isNull),
      ],
      verify: (_) => verify(
        () => sendMessage(
          const SendMessageParams(
            conversationId: 'c1',
            authorId: 'me',
            text: 'hello',
          ),
        ),
      ).called(1),
    );

    blocTest<ChatBloc, ChatState>(
      'surfaces a send failure without clearing the thread',
      setUp: () {
        when(() => sendMessage(any())).thenAnswer(
          (_) async => const Left<Failure, Message>(NetworkFailure()),
        );
      },
      build: buildBloc,
      seed: () => ChatState(
        conversationId: 'c1',
        status: ChatStatus.success,
        messages: <Message>[message],
      ),
      act: (ChatBloc bloc) =>
          bloc.add(const ChatMessageSubmitted(text: 'hello')),
      expect: () => <Matcher>[
        isA<ChatState>().having(
          (ChatState s) => s.isSending,
          'isSending',
          true,
        ),
        isA<ChatState>()
            .having((ChatState s) => s.isSending, 'isSending', false)
            .having(
              (ChatState s) => s.sendFailure,
              'sendFailure',
              const NetworkFailure(),
            )
            .having((ChatState s) => s.messages, 'messages', <Message>[
              message,
            ]),
      ],
    );
  });
}
