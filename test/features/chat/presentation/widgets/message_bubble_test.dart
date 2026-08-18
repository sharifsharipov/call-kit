import 'package:callkit_example/features/chat/domain/entities/message.dart';
import 'package:callkit_example/features/chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  Message message({MessageStatus status = MessageStatus.sent}) => Message(
    id: 'm1',
    conversationId: 'c1',
    authorId: 'me',
    text: 'Tested at textScale 1.3',
    sentAt: DateTime(2026, 8, 18, 10, 5),
    status: status,
  );

  testWidgets('renders the message text and time', (WidgetTester tester) async {
    await tester.pumpApp(MessageBubble(message: message(), isMine: true));

    expect(find.text('Tested at textScale 1.3'), findsOneWidget);
    expect(find.text('10:05'), findsOneWidget);
  });

  testWidgets('aligns own messages right and peer messages left', (
    WidgetTester tester,
  ) async {
    await tester.pumpApp(MessageBubble(message: message(), isMine: true));
    expect(
      tester.widget<Align>(find.byType(Align).first).alignment,
      Alignment.centerRight,
    );

    await tester.pumpApp(MessageBubble(message: message(), isMine: false));
    expect(
      tester.widget<Align>(find.byType(Align).first).alignment,
      Alignment.centerLeft,
    );
  });

  testWidgets('shows a delivery tick only on own messages', (
    WidgetTester tester,
  ) async {
    await tester.pumpApp(
      MessageBubble(message: message(status: MessageStatus.read), isMine: true),
    );
    expect(find.bySemanticsLabel('Read'), findsOneWidget);

    await tester.pumpApp(
      MessageBubble(
        message: message(status: MessageStatus.read),
        isMine: false,
      ),
    );
    expect(find.bySemanticsLabel('Read'), findsNothing);
  });

  testWidgets('wraps a long message without overflowing a 360dp screen', (
    WidgetTester tester,
  ) async {
    final Message long = Message(
      id: 'm2',
      conversationId: 'c1',
      authorId: 'me',
      text: 'A' * 600,
      sentAt: DateTime(2026, 8, 18, 10, 5),
    );

    await tester.pumpApp(
      MessageBubble(message: long, isMine: true),
      surfaceSize: const Size(360, 640),
      textScale: 1.3,
    );

    expect(tester.takeException(), isNull);
  });
}
