import 'package:flutter/material.dart';

abstract final class AppTypography {
  static TextTheme textTheme(Color onSurface, Color onSurfaceVariant) {
    return TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: onSurface,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        height: 1.25,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      bodyLarge: TextStyle(fontSize: 16, height: 1.4, color: onSurface),
      bodyMedium: TextStyle(fontSize: 14, height: 1.4, color: onSurfaceVariant),
      labelLarge: TextStyle(
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      labelSmall: TextStyle(fontSize: 12, height: 1.2, color: onSurfaceVariant),
    );
  }
}
