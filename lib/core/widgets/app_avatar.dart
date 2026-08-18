import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_tokens.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    required this.name,
    this.imageUrl,
    this.size = AppSizes.avatarMd,
    this.isOnline = false,
    super.key,
  });

  final String name;
  final String? imageUrl;
  final double size;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final double dotSize = (size / 4).clamp(10.0, 18.0);

    final Widget avatar = ClipOval(
      child: SizedBox.square(
        dimension: size,
        child: _AvatarSurface(name: name, imageUrl: imageUrl, size: size),
      ),
    );

    if (!isOnline) {
      return avatar;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        avatar,
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              color: AppColors.positive,
              shape: BoxShape.circle,
              border: Border.all(color: scheme.surface, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

class _AvatarSurface extends StatelessWidget {
  const _AvatarSurface({
    required this.name,
    required this.imageUrl,
    required this.size,
  });

  final String name;
  final String? imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    final Color background = _backgroundFor(name);
    final String? url = imageUrl;

    if (url == null || url.isEmpty) {
      return _Initials(name: name, size: size, background: background);
    }

    return Image.network(
      url,
      fit: BoxFit.cover,
      errorBuilder: (BuildContext _, Object _, StackTrace? _) =>
          _Initials(name: name, size: size, background: background),
    );
  }

  static Color _backgroundFor(String name) {
    if (name.isEmpty) {
      return AppColors.avatarPalette.first;
    }
    final int hash = name.codeUnits.fold<int>(
      0,
      (int acc, int unit) => acc + unit,
    );
    return AppColors.avatarPalette[hash % AppColors.avatarPalette.length];
  }
}

class _Initials extends StatelessWidget {
  const _Initials({
    required this.name,
    required this.size,
    required this.background,
  });

  final String name;
  final double size;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: background,
      child: Center(
        child: Text(
          _initialsOf(name),
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            color: AppColors.neutral0,
            fontSize: size * 0.38,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
    );
  }

  static String _initialsOf(String name) {
    final List<String> parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((String part) => part.isNotEmpty)
        .toList(growable: false);
    if (parts.isEmpty) {
      return '?';
    }
    if (parts.length == 1) {
      return parts.first.characters.first.toUpperCase();
    }
    return '${parts.first.characters.first}${parts[1].characters.first}'
        .toUpperCase();
  }
}
