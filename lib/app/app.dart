import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/l10n/generated/app_l10n.dart';
import 'theme/app_theme.dart';

class CallKitApp extends StatelessWidget {
  const CallKitApp({required this.router, super.key});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (BuildContext context) => AppL10n.of(context).appTitle,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppL10n.localizationsDelegates,
      supportedLocales: AppL10n.supportedLocales,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
