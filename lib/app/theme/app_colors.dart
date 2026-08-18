import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color brand = Color(0xFF2F6BFF);
  static const Color brandDark = Color(0xFF8CB0FF);

  static const Color positive = Color(0xFF1FB55A);
  static const Color danger = Color(0xFFE5484D);

  static const Color readReceipt = Color(0xFF7FD0FF);

  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF6F7F9);
  static const Color neutral100 = Color(0xFFEDEFF3);
  static const Color neutral300 = Color(0xFFC7CCD6);
  static const Color neutral500 = Color(0xFF79808F);
  static const Color neutral700 = Color(0xFF3B4150);
  static const Color neutral900 = Color(0xFF10131A);
  static const Color neutral950 = Color(0xFF070910);
  static const List<Color> avatarPalette = <Color>[
    Color(0xFF2F6BFF),
    Color(0xFF7A3FF2),
    Color(0xFF0F8F86),
    Color(0xFFB4531A),
    Color(0xFF9C2B6B),
    Color(0xFF2C6B2F),
  ];
}

abstract final class CallPalette {
  static const Color backgroundTop = Color(0xFF1B2033);
  static const Color backgroundBottom = Color(0xFF070910);
  static const Color surface = Color(0x1FFFFFFF);
  static const Color surfaceActive = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFFFFFFFF);
  static const Color onSurfaceActive = Color(0xFF10131A);
  static const Color onSurfaceMuted = Color(0xB3FFFFFF);
  static const Color accept = AppColors.positive;
  static const Color decline = AppColors.danger;
}
