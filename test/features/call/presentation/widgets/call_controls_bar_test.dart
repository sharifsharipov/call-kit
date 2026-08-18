import 'package:callkit_example/features/call/domain/entities/call.dart';
import 'package:callkit_example/features/call/presentation/bloc/call_bloc.dart'
    show CallMediaControl;
import 'package:callkit_example/features/call/presentation/widgets/call_controls_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  Call call({
    CallMedia media = CallMedia.video,
    bool isMicrophoneEnabled = true,
    bool isCameraEnabled = true,
  }) => Call(
    id: 'call-1',
    peerId: 'u1',
    peerName: 'Dilnoza',
    direction: CallDirection.outgoing,
    media: media,
    status: CallStatus.active,
    createdAt: DateTime(2026, 8, 18, 10),
    isMicrophoneEnabled: isMicrophoneEnabled,
    isCameraEnabled: isCameraEnabled,
  );

  Widget bar(
    Call value, {
    ValueChanged<CallMediaControl>? onToggle,
    VoidCallback? onHangUp,
  }) => CallControlsBar(
    call: value,
    onToggle: onToggle ?? (_) {},
    onHangUp: onHangUp ?? () {},
  );

  testWidgets('hides the camera controls on an audio call', (
    WidgetTester tester,
  ) async {
    await tester.pumpApp(bar(call(media: CallMedia.audio)));

    expect(find.byIcon(Icons.mic), findsOneWidget);
    expect(find.byIcon(Icons.videocam), findsNothing);
    expect(find.byIcon(Icons.cameraswitch_outlined), findsNothing);
  });

  testWidgets('reports the control that was tapped', (
    WidgetTester tester,
  ) async {
    final List<CallMediaControl> tapped = <CallMediaControl>[];
    await tester.pumpApp(bar(call(), onToggle: tapped.add));

    await tester.tap(find.byIcon(Icons.mic));
    await tester.tap(find.byIcon(Icons.videocam));
    await tester.pump();

    expect(tapped, <CallMediaControl>[
      CallMediaControl.microphone,
      CallMediaControl.camera,
    ]);
  });

  testWidgets('disables switch-camera while the camera is off', (
    WidgetTester tester,
  ) async {
    await tester.pumpApp(bar(call(isCameraEnabled: false)));

    final InkWell switchCamera = tester.widget<InkWell>(
      find.ancestor(
        of: find.byIcon(Icons.cameraswitch_outlined),
        matching: find.byType(InkWell),
      ),
    );
    expect(switchCamera.onTap, isNull);
  });

  testWidgets('reflows instead of overflowing at 360dp and textScale 1.3', (
    WidgetTester tester,
  ) async {
    await tester.pumpApp(
      bar(call()),
      surfaceSize: const Size(360, 800),
      textScale: 1.3,
    );

    expect(tester.takeException(), isNull);
  });
}
