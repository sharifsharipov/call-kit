import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/config/env.dart';

import '../../domain/entities/message.dart';
import '../models/conversation_model.dart';
import '../models/message_model.dart';
import 'chat_remote_data_source.dart';

/// In-memory chat transport used when no Firebase project is configured.
///
/// It exists so the app is runnable and the UI is testable before backend
/// credentials land. Because it implements the same contract as the Firestore
/// source, swapping between them is a one-line change in the DI container and
/// no other file knows the difference.
@LazySingleton(as: ChatRemoteDataSource)
@Environment(Env.demo)
class InMemoryChatRemoteDataSource implements ChatRemoteDataSource {
  InMemoryChatRemoteDataSource()
    : _conversations = _seedConversations(),
      _messages = _seedMessages();

  final List<ConversationModel> _conversations;
  final Map<String, List<MessageModel>> _messages;

  final StreamController<List<ConversationModel>> _conversationsController =
      StreamController<List<ConversationModel>>.broadcast();
  final Map<String, StreamController<List<MessageModel>>> _messageControllers =
      <String, StreamController<List<MessageModel>>>{};

  int _idSeed = 0;

  @override
  Stream<List<ConversationModel>> watchConversations({
    required String userId,
  }) async* {
    yield List<ConversationModel>.unmodifiable(_conversations);
    yield* _conversationsController.stream;
  }

  @override
  Stream<List<MessageModel>> watchMessages({
    required String conversationId,
  }) async* {
    yield List<MessageModel>.unmodifiable(_thread(conversationId));
    yield* _controllerFor(conversationId).stream;
  }

  @override
  Future<MessageModel> sendMessage({
    required String conversationId,
    required String authorId,
    required String text,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 220));

    final MessageModel message = MessageModel(
      id: 'local-${_idSeed++}',
      conversationId: conversationId,
      authorId: authorId,
      text: text,
      sentAt: DateTime.now(),
      status: MessageStatus.sent,
    );

    _thread(conversationId).add(message);
    _controllerFor(conversationId)
        .add(List<MessageModel>.unmodifiable(_thread(conversationId)));
    _touchConversation(conversationId, text, message.sentAt);

    return message;
  }

  /// Releases every broadcast controller. Wired to the container's teardown,
  /// so the demo source cannot outlive the app.
  @disposeMethod
  @override
  Future<void> dispose() async {
    await _conversationsController.close();
    for (final StreamController<List<MessageModel>> controller
        in _messageControllers.values) {
      await controller.close();
    }
    _messageControllers.clear();
  }

  List<MessageModel> _thread(String conversationId) =>
      _messages.putIfAbsent(conversationId, () => <MessageModel>[]);

  StreamController<List<MessageModel>> _controllerFor(String conversationId) =>
      _messageControllers.putIfAbsent(
        conversationId,
        StreamController<List<MessageModel>>.broadcast,
      );

  void _touchConversation(String conversationId, String preview, DateTime at) {
    final int index = _conversations.indexWhere(
      (ConversationModel c) => c.id == conversationId,
    );
    if (index == -1) {
      return;
    }
    final ConversationModel current = _conversations[index];
    _conversations
      ..removeAt(index)
      ..insert(
        0,
        ConversationModel(
          id: current.id,
          peerId: current.peerId,
          peerName: current.peerName,
          peerAvatarUrl: current.peerAvatarUrl,
          lastMessagePreview: preview,
          lastMessageAt: at,
          isPeerOnline: current.isPeerOnline,
        ),
      );
    _conversationsController.add(
      List<ConversationModel>.unmodifiable(_conversations),
    );
  }

  static List<ConversationModel> _seedConversations() {
    final DateTime now = DateTime.now();
    return <ConversationModel>[
      ConversationModel(
        id: 'c1',
        peerId: 'u-dilnoza',
        peerName: 'Dilnoza Karimova',
        lastMessagePreview: 'Sending the design tokens over now.',
        lastMessageAt: now.subtract(const Duration(minutes: 4)),
        unreadCount: 2,
        isPeerOnline: true,
      ),
      ConversationModel(
        id: 'c2',
        peerId: 'u-bekzod',
        peerName: 'Bekzod Rustamov',
        lastMessagePreview: 'Call me when you are free 👋',
        lastMessageAt: now.subtract(const Duration(hours: 3)),
        unreadCount: 12,
      ),
      ConversationModel(
        id: 'c3',
        peerId: 'u-madina',
        peerName: 'Madina Yusupova',
        lastMessagePreview: 'The release build passed review.',
        lastMessageAt: now.subtract(const Duration(days: 1, hours: 2)),
        isPeerOnline: true,
      ),
      ConversationModel(
        id: 'c4',
        peerId: 'u-jasur',
        peerName: 'Jasur Toshmatov',
        lastMessagePreview: 'Thanks, that fixed the crash on Android 13.',
        lastMessageAt: now.subtract(const Duration(days: 3)),
      ),
      ConversationModel(
        id: 'c5',
        peerId: 'u-nilufar',
        peerName: 'Nilufar Ergasheva',
        lastMessagePreview: 'See you at the standup.',
        lastMessageAt: now.subtract(const Duration(days: 12)),
      ),
    ];
  }

  static Map<String, List<MessageModel>> _seedMessages() {
    final DateTime now = DateTime.now();
    MessageModel message(String id, String author, String text, Duration ago) =>
        MessageModel(
          id: id,
          conversationId: 'c1',
          authorId: author,
          text: text,
          sentAt: now.subtract(ago),
          status: MessageStatus.read,
        );

    return <String, List<MessageModel>>{
      'c1': <MessageModel>[
        message(
          'm1',
          'u-dilnoza',
          'Salom! Did you get a chance to look at the call screen?',
          const Duration(days: 1, hours: 5),
        ),
        message(
          'm2',
          'me',
          'Yes — the layout holds up at 360dp, I checked the overflow case.',
          const Duration(days: 1, hours: 4),
        ),
        message(
          'm3',
          'u-dilnoza',
          'Perfect. What about large system fonts?',
          const Duration(minutes: 42),
        ),
        message(
          'm4',
          'me',
          'Tested at textScale 1.3, the control bar wraps instead of clipping.',
          const Duration(minutes: 21),
        ),
        message(
          'm5',
          'u-dilnoza',
          'Sending the design tokens over now.',
          const Duration(minutes: 4),
        ),
      ],
    };
  }
}
