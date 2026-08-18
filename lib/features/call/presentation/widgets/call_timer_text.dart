import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/utils/duration_formatter.dart';

/// Ticking call duration.
///
/// The timer lives in this leaf widget rather than in the BLoC: a per-second
/// state emission would rebuild the entire call screen, while this rebuilds
/// one `Text`.
class CallTimerText extends StatefulWidget {
  const CallTimerText({
    required this.connectedAt,
    this.style,
    this.clock = DateTime.now,
    super.key,
  });

  final DateTime connectedAt;
  final TextStyle? style;

  /// Wall-clock source. Injected so a test can advance time deterministically
  /// instead of waiting on the real clock.
  final DateTime Function() clock;

  @override
  State<CallTimerText> createState() => _CallTimerTextState();
}

class _CallTimerTextState extends State<CallTimerText> {
  late Timer _ticker;
  late Duration _elapsed = _elapsedNow();

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() => _elapsed = _elapsedNow()),
    );
  }

  @override
  void didUpdateWidget(CallTimerText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.connectedAt != widget.connectedAt) {
      _elapsed = _elapsedNow();
    }
  }

  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }

  Duration _elapsedNow() {
    final Duration elapsed = widget.clock().difference(widget.connectedAt);
    return elapsed.isNegative ? Duration.zero : elapsed;
  }

  @override
  Widget build(BuildContext context) =>
      Text(_elapsed.asCallTimer, style: widget.style);
}
