import 'package:callkit_example/app/app.dart';
import 'package:callkit_example/app/di/injector.dart';
import 'package:callkit_example/app/router/app_router.dart';
import 'package:callkit_example/core/config/env.dart';
import 'package:callkit_example/core/session/session_user.dart';
import 'package:callkit_example/features/call/presentation/pages/incoming_call_page.dart';
import 'package:callkit_example/features/call/presentation/pages/ongoing_call_page.dart';
import 'package:callkit_example/features/call/presentation/widgets/call_timer_text.dart';
import 'package:callkit_example/features/chat/presentation/pages/chat_page.dart';
import 'package:callkit_example/features/chat/presentation/pages/conversations_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// End-to-end wiring test.
///
/// Runs the real router, the real DI graph and the real BLoCs against the
/// in-memory data sources — the same objects a demo build boots with. It is
/// the cheapest proof that navigation, dependency wiring and both features
/// actually work together, and it catches the class of breakage a per-widget
/// test never sees.
void main() {
  setUp(() => configureDependencies(environment: Env.demo));

  tearDown(resetDependencies);

  Future<void> pumpAppUnderTest(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      CallKitApp(router: AppRouter.create(user: SessionUser.demo)),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('inbox lists the seeded conversations', (
    WidgetTester tester,
  ) async {
    await pumpAppUnderTest(tester);

    expect(find.byType(ConversationsPage), findsOneWidget);
    expect(find.text('Dilnoza Karimova'), findsOneWidget);
    expect(find.text('Bekzod Rustamov'), findsOneWidget);
    expect(find.text('12'), findsOneWidget); // unread badge
  });

  testWidgets('opening a conversation shows its thread and sends a message', (
    WidgetTester tester,
  ) async {
    await pumpAppUnderTest(tester);

    await tester.tap(find.text('Dilnoza Karimova'));
    await tester.pumpAndSettle();

    expect(find.byType(ChatPage), findsOneWidget);
    expect(find.text('Sending the design tokens over now.'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Ready for review');
    await tester.pump();
    await tester.tap(find.byIcon(Icons.send_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Ready for review'), findsOneWidget);
  });

  testWidgets('placing a video call opens the in-call screen and hangs up', (
    WidgetTester tester,
  ) async {
    await pumpAppUnderTest(tester);

    await tester.tap(find.text('Dilnoza Karimova'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.videocam_outlined));
    await tester.pumpAndSettle();

    expect(find.byType(OngoingCallPage), findsOneWidget);
    expect(find.text('Ringing…'), findsOneWidget);

    // The simulated peer answers after a beat; the status line becomes a timer.
    // The elapsed value stays 0:00 because the widget reads the real clock,
    // which barely moves inside a fake-async test — the ticking itself is
    // covered by call_timer_text_test.dart.
    await tester.pump(const Duration(seconds: 4));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Ringing…'), findsNothing);
    expect(find.byType(CallTimerText), findsOneWidget);
    expect(find.text('0:00'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.call_end_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(OngoingCallPage), findsNothing);
    expect(find.byType(ChatPage), findsOneWidget);
  });

  testWidgets('an incoming call can be answered and then ended', (
    WidgetTester tester,
  ) async {
    await pumpAppUnderTest(tester);

    await tester.tap(find.byIcon(Icons.phone_callback_outlined));
    await tester.pumpAndSettle();

    expect(find.byType(IncomingCallPage), findsOneWidget);
    expect(find.text('Incoming video call'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.call_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(OngoingCallPage), findsOneWidget);

    await tester.tap(find.byIcon(Icons.call_end_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(OngoingCallPage), findsNothing);
  });

  testWidgets('declining an incoming call closes the screen', (
    WidgetTester tester,
  ) async {
    await pumpAppUnderTest(tester);

    await tester.tap(find.byIcon(Icons.phone_callback_outlined));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.call_end_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(IncomingCallPage), findsNothing);
    expect(find.byType(ConversationsPage), findsOneWidget);
  });
}
