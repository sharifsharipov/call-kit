import 'package:callkit_example/core/error/exceptions.dart';
import 'package:callkit_example/core/error/failures.dart';
import 'package:callkit_example/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:callkit_example/features/chat/data/models/conversation_model.dart';
import 'package:callkit_example/features/chat/data/models/message_model.dart';
import 'package:callkit_example/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:callkit_example/features/chat/domain/entities/conversation.dart';
import 'package:callkit_example/features/chat/domain/entities/message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class _MockChatRemoteDataSource extends Mock implements ChatRemoteDataSource {}

void main() {
  late _MockChatRemoteDataSource remote;
  late ChatRepositoryImpl repository;

  final ConversationModel conversation = ConversationModel(
    id: 'c1',
    peerId: 'u1',
    peerName: 'Dilnoza',
    lastMessageAt: DateTime(2026, 8, 18, 9),
  );
  final MessageModel message = MessageModel(
    id: 'm1',
    conversationId: 'c1',
    authorId: 'me',
    text: 'hello',
    sentAt: DateTime(2026, 8, 18, 10),
  );

  setUp(() {
    remote = _MockChatRemoteDataSource();
    repository = ChatRepositoryImpl(remote);
  });

  group('watchConversations', () {
    test('wraps each emission in a Right', () async {
      when(() => remote.watchConversations(userId: 'me')).thenAnswer(
        (_) => Stream<List<ConversationModel>>.value(<ConversationModel>[
          conversation,
        ]),
      );

      final Either<Failure, List<Conversation>> result = await repository
          .watchConversations(userId: 'me')
          .first;

      // The payload is unwrapped before comparison: two equal lists are
      // different instances, so `Either` equality alone would not match.
      expect(result.getRight().toNullable(), <Conversation>[
        conversation.toEntity(),
      ]);
    });

    test('maps a permission exception to a PermissionFailure', () async {
      when(() => remote.watchConversations(userId: 'me')).thenAnswer(
        (_) => Stream<List<ConversationModel>>.error(
          const PermissionException('denied', code: 'permission-denied'),
        ),
      );

      final Either<Failure, List<Conversation>> result = await repository
          .watchConversations(userId: 'me')
          .first;

      expect(
        result.getLeft().toNullable(),
        const PermissionFailure('denied', code: 'permission-denied'),
      );
    });
  });

  group('sendMessage', () {
    test('returns the stored message on success', () async {
      when(
        () => remote.sendMessage(
          conversationId: 'c1',
          authorId: 'me',
          text: 'hello',
        ),
      ).thenAnswer((_) async => message);

      final Either<Failure, Message> result = await repository.sendMessage(
        conversationId: 'c1',
        authorId: 'me',
        text: 'hello',
      );

      expect(result, Right<Failure, Message>(message.toEntity()));
    });

    test('maps a network exception to a NetworkFailure', () async {
      when(
        () => remote.sendMessage(
          conversationId: any(named: 'conversationId'),
          authorId: any(named: 'authorId'),
          text: any(named: 'text'),
        ),
      ).thenThrow(const NetworkException());

      final Either<Failure, Message> result = await repository.sendMessage(
        conversationId: 'c1',
        authorId: 'me',
        text: 'hello',
      );

      expect(
        result,
        const Left<Failure, Message>(NetworkFailure('No internet connection.')),
      );
    });

    test('maps an unrecognised error to an UnexpectedFailure', () async {
      when(
        () => remote.sendMessage(
          conversationId: any(named: 'conversationId'),
          authorId: any(named: 'authorId'),
          text: any(named: 'text'),
        ),
      ).thenThrow(StateError('boom'));

      final Either<Failure, Message> result = await repository.sendMessage(
        conversationId: 'c1',
        authorId: 'me',
        text: 'hello',
      );

      expect(result, const Left<Failure, Message>(UnexpectedFailure()));
    });
  });
}
