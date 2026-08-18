/// Every route in the app, declared once.
///
/// Paths and their builders live apart so no widget has to hand-assemble a
/// URL — a rename is a single edit here.
abstract final class AppRoutes {
  static const String conversations = '/';
  static const String chat = '/chat/:conversationId';
  static const String incomingCall = '/call/:callId/incoming';
  static const String ongoingCall = '/call/:callId/ongoing';

  static const String conversationsName = 'conversations';
  static const String chatName = 'chat';
  static const String incomingCallName = 'incomingCall';
  static const String ongoingCallName = 'ongoingCall';

  static const String conversationIdParam = 'conversationId';
  static const String callIdParam = 'callId';

  static String chatPathFor(String conversationId) =>
      '/chat/${Uri.encodeComponent(conversationId)}';

  static String incomingCallPathFor(String callId) =>
      '/call/${Uri.encodeComponent(callId)}/incoming';

  static String ongoingCallPathFor(String callId) =>
      '/call/${Uri.encodeComponent(callId)}/ongoing';
}
