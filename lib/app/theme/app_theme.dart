import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_tokens.dart';
import 'app_typography.dart';

/// Single source of truth for the app's visual language.
abstract final class AppTheme {
  static ThemeData get light => _build(
    Brightness.light,
    const ColorScheme.light(
      primary: AppColors.brand,
      onPrimary: AppColors.neutral0,
      secondary: AppColors.brand,
      surface: AppColors.neutral0,
      onSurface: AppColors.neutral900,
      surfaceContainerHighest: AppColors.neutral100,
      onSurfaceVariant: AppColors.neutral500,
      outlineVariant: AppColors.neutral100,
      error: AppColors.danger,
    ),
    scaffold: AppColors.neutral50,
  );

  static ThemeData get dark => _build(
    Brightness.dark,
    const ColorScheme.dark(
      primary: AppColors.brandDark,
      onPrimary: AppColors.neutral950,
      secondary: AppColors.brandDark,
      surface: AppColors.neutral900,
      onSurface: AppColors.neutral0,
      surfaceContainerHighest: AppColors.neutral700,
      onSurfaceVariant: AppColors.neutral300,
      outlineVariant: AppColors.neutral700,
      error: AppColors.danger,
    ),
    scaffold: AppColors.neutral950,
  );

  static ThemeData _build(
    Brightness brightness,
    ColorScheme scheme, {
    required Color scaffold,
  }) {
    final TextTheme textTheme = AppTypography.textTheme(
      scheme.onSurface,
      scheme.onSurfaceVariant,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scaffold,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        titleTextStyle: textTheme.titleMedium,
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        space: 1,
        thickness: 1,
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        minVerticalPadding: AppSpacing.md,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          borderSide: BorderSide.none,
        ),
        hintStyle: textTheme.bodyMedium,
      ),
    );
  }
}
