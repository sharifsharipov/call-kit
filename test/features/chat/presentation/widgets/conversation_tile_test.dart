import 'package:callkit_example/features/chat/domain/entities/conversation.dart';
import 'package:callkit_example/features/chat/presentation/widgets/conversation_tile.dart';
import 'package:callkit_example/features/chat/presentation/widgets/unread_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  Conversation conversation({int unreadCount = 0}) => Conversation(
    id: 'c1',
    peerId: 'u1',
    peerName: 'Dilnoza Karimova',
    lastMessagePreview: 'Sending the design tokens over now.',
    lastMessageAt: DateTime.now(),
    unreadCount: unreadCount,
  );

  testWidgets('shows the peer name and last message', (
    WidgetTester tester,
  ) async {
    await tester.pumpApp(
      ConversationTile(conversation: conversation(), onTap: () {}),
    );

    expect(find.text('Dilnoza Karimova'), findsOneWidget);
    expect(find.text('Sending the design tokens over now.'), findsOneWidget);
  });

  testWidgets('renders the unread badge only when there is something unread', (
    WidgetTester tester,
  ) async {
    await tester.pumpApp(
      ConversationTile(conversation: conversation(), onTap: () {}),
    );
    expect(find.byType(UnreadBadge), findsNothing);

    await tester.pumpApp(
      ConversationTile(
        conversation: conversation(unreadCount: 3),
        onTap: () {},
      ),
    );
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('caps the unread badge at 99+', (WidgetTester tester) async {
    await tester.pumpApp(
      ConversationTile(
        conversation: conversation(unreadCount: 420),
        onTap: () {},
      ),
    );

    expect(find.text('99+'), findsOneWidget);
  });

  testWidgets('reports taps', (WidgetTester tester) async {
    int taps = 0;
    await tester.pumpApp(
      ConversationTile(conversation: conversation(), onTap: () => taps++),
    );

    await tester.tap(find.byType(ListTile));
    await tester.pump();

    expect(taps, 1);
  });
}
