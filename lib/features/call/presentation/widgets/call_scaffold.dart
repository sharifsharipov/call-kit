import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/theme/app_colors.dart';

/// Shared chrome for both call screens.
///
/// The call surface is dark in every theme — the same convention the platform
/// dialers follow — so it carries its own palette instead of the app's
/// [ColorScheme], and forces light system icons to match.
class CallScaffold extends StatelessWidget {
  const CallScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: CallPalette.backgroundBottom,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                CallPalette.backgroundTop,
                CallPalette.backgroundBottom,
              ],
            ),
          ),
          child: SafeArea(child: child),
        ),
      ),
    );
  }
}
