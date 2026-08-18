import 'package:callkit_example/app/theme/app_theme.dart';
import 'package:callkit_example/core/l10n/generated/app_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Wraps a widget in the same theme and localisation scope the real app gives
/// it, so a widget test exercises the production configuration.
extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget child, {
    ThemeData? theme,
    Size? surfaceSize,
    double textScale = 1,
  }) async {
    if (surfaceSize != null) {
      await binding.setSurfaceSize(surfaceSize);
      addTearDown(() => binding.setSurfaceSize(null));
    }

    await pumpWidget(
      MaterialApp(
        theme: theme ?? AppTheme.light,
        localizationsDelegates: AppL10n.localizationsDelegates,
        supportedLocales: AppL10n.supportedLocales,
        home: MediaQuery(
          data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
          child: Scaffold(body: child),
        ),
      ),
    );
    await pump();
  }
}
