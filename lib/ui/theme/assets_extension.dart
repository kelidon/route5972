import 'package:flutter/material.dart';

class AssetsLibrary extends ThemeExtension<AssetsLibrary> {
  const AssetsLibrary._({
    required this.mainMenuBackground,
    required this.mainMenuButton,
  });

  factory AssetsLibrary.build() {
    return AssetsLibrary._(
      mainMenuBackground: 'main_menu/main_menu_background.png',
      mainMenuButton: 'main_menu/main_menu_background.png',
    );
  }

  final String mainMenuBackground;
  final String mainMenuButton;

  @override
  AssetsLibrary lerp(final AssetsLibrary? other, final double t) {
    if (other is! AssetsLibrary) return this;
    return other;
  }

  @override
  AssetsLibrary copyWith({
    String? mainMenuBackground,
    String? mainMenuButton,
  }) {
    return AssetsLibrary._(
      mainMenuBackground: mainMenuBackground ?? this.mainMenuBackground,
      mainMenuButton: mainMenuButton ?? this.mainMenuButton,
    );
  }
}
