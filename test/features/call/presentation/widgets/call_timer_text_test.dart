import 'package:callkit_example/features/call/presentation/widgets/call_timer_text.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  final DateTime connectedAt = DateTime(2026, 8, 18, 10);

  testWidgets('starts at zero and advances once per second', (
    WidgetTester tester,
  ) async {
    DateTime now = connectedAt;

    await tester.pumpApp(
      CallTimerText(connectedAt: connectedAt, clock: () => now),
    );
    expect(find.text('0:00'), findsOneWidget);

    now = connectedAt.add(const Duration(seconds: 5));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('0:05'), findsOneWidget);

    now = connectedAt.add(const Duration(minutes: 61, seconds: 5));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('1:01:05'), findsOneWidget);
  });

  testWidgets('never renders a negative duration', (WidgetTester tester) async {
    await tester.pumpApp(
      CallTimerText(
        connectedAt: connectedAt,
        clock: () => connectedAt.subtract(const Duration(seconds: 30)),
      ),
    );

    expect(find.text('0:00'), findsOneWidget);
  });
}
